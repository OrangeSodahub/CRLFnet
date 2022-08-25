# !/usr/bin/python3

import argparse
from pathlib import Path
from typing import Tuple
import numpy as np
import yaml

import rospy
import message_filters
from std_msgs.msg import Float64, Float64MultiArray
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped
from msgs.msg._MsgRadCam import MsgRadCam  # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam  # lidar camera fusion message type
from tf.transformations import euler_from_quaternion

from .agent import Agents, Agent
from .scene import SceneMap
from ..utils.evaluation import evalagent

N = 10  # the number of vewhicles


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


class VehicleController:

    def __init__(self, index: int, map: SceneMap) -> None:
        self.agent = Agent(map, index)
        self.pub = VehiclePublisher("deepracer{}".format(index))


def odom2pose(odom: Odometry) -> Tuple[np.ndarray, float]:
    pos = odom.pose.pose.position
    orient = odom.pose.pose.orientation
    r, p, y = euler_from_quaternion([orient.x, orient.y, orient.z, orient.w])
    return np.array([pos.x, pos.y]), y


def set_control(odom1: Odometry,
                odom2: Odometry,
                odom3: Odometry,
                odom4: Odometry,
                odom5: Odometry,
                odom6: Odometry,
                odom7: Odometry,
                odom8: Odometry,
                odom9: Odometry,
                odom10: Odometry,
                msgradcam: MsgRadCam = None,
                msglidcam: MsgLidCam = None) -> None:
    global pub_nums, pub_velocity, pub_vehicles

    poses = [
        odom2pose(odom1),
        odom2pose(odom2),
        odom2pose(odom3),
        odom2pose(odom4),
        odom2pose(odom5),
        odom2pose(odom6),
        odom2pose(odom7),
        odom2pose(odom8),
        odom2pose(odom9),
        odom2pose(odom10)
    ]
    steers, throttles, nums_area = agents.navigate(poses, msgradcam, msglidcam)
    throttles = [t * 15 for t in throttles]

    # record
    if params.eval:
        eval.write(poses, throttles, nums_area)

    for i, pub in enumerate(pub_vehicles):
        pub.publish(throttles[i], steers[i])

    nums = Float64MultiArray()
    velocity = Float64MultiArray()
    nums.data = nums_area
    velocity.data = [abs(t) for t in throttles]
    pub_nums.publish(nums)
    pub_velocity.publish(velocity)


def servo_commands() -> None:

    rospy.init_node('servo_commands', anonymous=True)

    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)

    sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
    sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odoms = [message_filters.Subscriber('/deepracer{}/base_pose_ground_truth'.format(i), Odometry) for i in range(1, N + 1)]
    sync = message_filters.ApproximateTimeSynchronizer(sub_odoms, 1, 1)
    sync.registerCallback(set_control)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
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
    scene_map = SceneMap(MAP_DIR)
    agents = Agents(scene_map, 10)
    if params.eval:
        SAVE_DIR = ROOT_DIR.joinpath('src/agent/eval')
        eval = evalagent(10, SAVE_DIR)

    pub_nums = rospy.Publisher('/nums', Float64MultiArray, queue_size=1)
    pub_velocity = rospy.Publisher('/velocity', Float64MultiArray, queue_size=1)
    pub_vehicles = [VehiclePublisher('deepracer{}'.format(i)) for i in range(1, N + 1)]

    servo_commands()
