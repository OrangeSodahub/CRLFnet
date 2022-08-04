# !/usr/bin/python3

import argparse
from pathlib import Path
import numpy as np
import yaml

import rospy
import message_filters
from std_msgs.msg import Float64
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped
from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type
from tf.transformations import euler_from_quaternion

from .agent import Agents
from .scene import SceneMap


flag_move = 0


def set_throttle_steer(odom1: Odometry, odom2: Odometry, odom3: Odometry, odom4: Odometry, msgradcam: MsgRadCam = None, msglidcam: MsgLidCam = None):

    global flag_move, agent

    # throttle = key.drive.speed*13.95348
    # steer = key.drive.steering_angle

    # declear the publish tools
    pub_vel_left_rear_wheel_1 = rospy.Publisher('/deepracer1/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_1 = rospy.Publisher('/deepracer1/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_1 = rospy.Publisher('/deepracer1/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_1 = rospy.Publisher('/deepracer1/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_1 = rospy.Publisher('/deepracer1/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_1 = rospy.Publisher('/deepracer1/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    pub_vel_left_rear_wheel_2 = rospy.Publisher('/deepracer2/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_2 = rospy.Publisher('/deepracer2/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_2 = rospy.Publisher('/deepracer2/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_2 = rospy.Publisher('/deepracer2/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_2 = rospy.Publisher('/deepracer2/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_2 = rospy.Publisher('/deepracer2/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    pub_vel_left_rear_wheel_3 = rospy.Publisher('/deepracer3/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_3 = rospy.Publisher('/deepracer3/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_3 = rospy.Publisher('/deepracer3/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_3 = rospy.Publisher('/deepracer3/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_3 = rospy.Publisher('/deepracer3/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_3 = rospy.Publisher('/deepracer3/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    pub_vel_left_rear_wheel_4 = rospy.Publisher('/deepracer4/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_4 = rospy.Publisher('/deepracer4/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_4 = rospy.Publisher('/deepracer4/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_4 = rospy.Publisher('/deepracer4/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_4 = rospy.Publisher('/deepracer4/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_4 = rospy.Publisher('/deepracer4/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    # publish the decisions
    # get all status
    status = []
    status.append(get_status(odom1))
    status.append(get_status(odom2))
    status.append(get_status(odom3))
    status.append(get_status(odom4))
    steers, throttles = agents.navigate(status, msgradcam, msglidcam)
    throttles = [throttle*10 for throttle in throttles]

    pub_vel_left_rear_wheel_1.publish(throttles[0])
    pub_vel_right_rear_wheel_1.publish(throttles[0])
    pub_vel_left_front_wheel_1.publish(throttles[0])
    pub_vel_right_front_wheel_1.publish(throttles[0])
    pub_pos_left_steering_hinge_1.publish(steers[0])
    pub_pos_right_steering_hinge_1.publish(steers[0])

    # vehicle2
    pub_vel_left_rear_wheel_2.publish(throttles[1])
    pub_vel_right_rear_wheel_2.publish(throttles[1])
    pub_vel_left_front_wheel_2.publish(throttles[1])
    pub_vel_right_front_wheel_2.publish(throttles[1])
    pub_pos_left_steering_hinge_2.publish(steers[1])
    pub_pos_right_steering_hinge_2.publish(steers[1])

    # vehicle3
    pub_vel_left_rear_wheel_3.publish(throttles[2])
    pub_vel_right_rear_wheel_3.publish(throttles[2])
    pub_vel_left_front_wheel_3.publish(throttles[2])
    pub_vel_right_front_wheel_3.publish(throttles[2])
    pub_pos_left_steering_hinge_3.publish(steers[2])
    pub_pos_right_steering_hinge_3.publish(steers[2])

    # vehicle4
    pub_vel_left_rear_wheel_4.publish(throttles[3])
    pub_vel_right_rear_wheel_4.publish(throttles[3])
    pub_vel_left_front_wheel_4.publish(throttles[3])
    pub_vel_right_front_wheel_4.publish(throttles[3])
    pub_pos_left_steering_hinge_4.publish(steers[3])
    pub_pos_right_steering_hinge_4.publish(steers[3])
    
    
def get_status(odom: Odometry):
    vehicle = np.array([odom.pose.pose.position.x, odom.pose.pose.position.y])
    r, p, y = euler_from_quaternion([odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                                    odom.pose.pose.orientation.z, odom.pose.pose.orientation.w])
    return [vehicle, y]


def servo_commands():

    rospy.init_node('servo_commands', anonymous=True)

    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)

    sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
    sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odom1 = message_filters.Subscriber('/deepracer1/base_pose_ground_truth', Odometry)
    sub_odom2 = message_filters.Subscriber('/deepracer2/base_pose_ground_truth', Odometry)
    sub_odom3 = message_filters.Subscriber('/deepracer3/base_pose_ground_truth', Odometry)
    sub_odom4 = message_filters.Subscriber('/deepracer4/base_pose_ground_truth', Odometry)
    sync = message_filters.ApproximateTimeSynchronizer([sub_odom1, sub_odom2, sub_odom3, sub_odom4], 1, 1)
    sync.registerCallback(set_throttle_steer)
    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= str(ROOT_DIR / 'config/config.yaml'))
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print('\033[0;31mConfig file could not be read.\033[0m')
            exit(1)

    MAP_DIR = ROOT_DIR.joinpath(config['dispatch']['scene_map'])
    scene_map = SceneMap(MAP_DIR)
    agents = Agents(ROOT_DIR / config['lanes']['file_dir'], scene_map, 4)
    servo_commands()
