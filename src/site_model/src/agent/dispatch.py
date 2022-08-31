# !/usr/bin/python3

import argparse
from pathlib import Path
from typing import List, Tuple
import numpy as np
import yaml

import rospy
import message_filters
from std_msgs.msg import Float64, Float64MultiArray
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped
from msgs.msg._MsgRadCam import MsgRadCam      # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam      # lidar camera fusion message type
from tf.transformations import euler_from_quaternion

from .scene import SceneMap
from .agent import DynamicMap, Agent
# from ..utils.evaluation import Evalagent

N = 10         # the number of vehicles
THROTTLE = 20  # the base value of throttle


class VehiclePublisher:

    def __init__(self, vehicle_name: str) -> None:
        # l: left, r: right, f: front, r: rear
        # yapf: disable
        self.lr_wheel = rospy.Publisher('/{}/left_rear_wheel_velocity_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        self.rr_wheel = rospy.Publisher('/{}/right_rear_wheel_velocity_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        self.lf_wheel = rospy.Publisher('/{}/left_front_wheel_velocity_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        self.rf_wheel = rospy.Publisher('/{}/right_front_wheel_velocity_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        self.l_steering_hinge = rospy.Publisher('/{}/left_steering_hinge_position_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        self.r_steering_hinge = rospy.Publisher('/{}/right_steering_hinge_position_controller/command'.format(vehicle_name), Float64, queue_size=1)  # noqa: E501
        # yapf: enable

    def publish(self, throttle: float, steer: float) -> None:
        self.lr_wheel.publish(throttle)
        self.rr_wheel.publish(throttle)
        self.lf_wheel.publish(throttle)
        self.rf_wheel.publish(throttle)
        self.l_steering_hinge.publish(steer)
        self.r_steering_hinge.publish(steer)


class Dispatch:

    def __init__(self, vehicle_num: int, scene_map: SceneMap, evalagent) -> None:
        self.scene_map = scene_map
        self.vehicles = [Agent(self.scene_map, i) for i in range(1, vehicle_num + 1)]
        self.pub_vehicles = [VehiclePublisher('deepracer{}'.format(i)) for i in range(1, N + 1)]
        self.pub_velocity = rospy.Publisher('/velocity', Float64MultiArray, queue_size=1)
        self.pub_num_area = rospy.Publisher('/nums', Float64MultiArray, queue_size=1)
        self.evalagent = evalagent

    def flush(self, odoms: List[Odometry], evaluate: bool = False) -> None:
        poses = list(map(odom2pose, odoms))
        num_lane, num_area = density(self.scene_map, poses)
        steers, throttles = [], []
        for p, v, pub in zip(poses, self.vehicles, self.pub_vehicles):
            steer, throttle = v.navigate(p, num_lane, num_area, poses)
            print(v)
            pub.publish(throttle * THROTTLE, steer)
            steers.append(steer)
            throttles.append(throttle)
        print(self.scene_map)
        self.publish(num_area, throttles)
        # evaluation
        if evaluate:
            self.evalagent.write(poses, throttles, num_area)

    def publish(self, num_area: np.ndarray, throttles: List[float]) -> None:
        """Publish the num_area and throttle data."""
        num_area_array = Float64MultiArray()
        velocity_array = Float64MultiArray()
        num_area_array.data = num_area
        velocity_array.data = np.abs(throttles)
        self.pub_num_area.publish(num_area_array)
        self.pub_velocity.publish(velocity_array)


def density(scene_map: SceneMap, target_poses: List[Tuple[np.ndarray, float]]) -> Tuple[np.ndarray, np.ndarray]:
    # the 'target_poses' is given in ((X, Y, Z), theta)
    num_lane = np.zeros(len(scene_map.lanes))
    num_area = np.zeros(4)
    for p in target_poses:
        # which way the target is on
        lane_index, _ = scene_map.nearest_point(p[0][0:2])
        num_lane[lane_index] += 1
        # which area the target is in
        # TODO: mark the areas in the scene map
        if p[0][2] >= 0.1:
            num_area[2] += 1   # overpass
        elif 0.0 <= p[0][1] <= 1.7 and -1.2 <= p[0][0] <= 1.0:
            num_area[0] += 1   # intersection
        elif -2.2 <= p[0][1] < 0.0 and -1.2 <= p[0][0] <= 1.0:
            num_area[1] += 1   # roundabout
        else:
            num_area[3] += 1   # outer ring
    return num_lane, num_area


def odom2pose(odom: Odometry) -> Tuple[np.ndarray, float]:
    pos = odom.pose.pose.position
    orient = odom.pose.pose.orientation
    r, p, y = euler_from_quaternion([orient.x, orient.y, orient.z, orient.w])
    return np.array([pos.x, pos.y, pos.z]), y


def set_control(o1, o2, o3, o4, o5, o6, o7, o8, o9, o10) -> None:
    global dispatch_system
    global params

    odoms: List[Odometry] = [o1, o2, o3, o4, o5, o6, o7, o8, o9, o10]
    dispatch_system.flush(odoms, params.eval)


if __name__ == '__main__':
    # parser
    parser = argparse.ArgumentParser()
    parser.add_argument("-e", "--eval", help="whether to evaluate", action='store_true', required=False)
    parser.add_argument("-v", "--vis", help="whether to visualize", action='store_true', required=False)
    params = parser.parse_args()

    # load config file
    ROOT_DIR = Path(__file__).resolve().parents[2]
    CONFIG_FILE = ROOT_DIR.joinpath('config/config.yaml')
    with open(CONFIG_FILE, 'r') as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    MAP_DIR = ROOT_DIR.joinpath(config['dispatch']['scene_map'])
    SAVE_DIR = ROOT_DIR.joinpath("src/agent/eval")

    # initialization
    scene_map = DynamicMap(MAP_DIR)
    if params.eval:
        evalagent = Evalagent(N, SAVE_DIR)
    else:
        evalagent = None
    dispatch_system = Dispatch(N, scene_map, evalagent)

    # ROS messages
    rospy.init_node('servo_commands', anonymous=True)
    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)
    sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
    sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odoms = [message_filters.Subscriber('/deepracer{}/base_pose_ground_truth'.format(i), Odometry) for i in range(1, N + 1)]

    sync = message_filters.ApproximateTimeSynchronizer(sub_odoms, 1, 1)

    sync.registerCallback(set_control)

    print("\033[0;32mDispatch System Initialized Successfully\033[0m")

    rospy.spin()
