#!/usr/bin/python3
import rospy
import yaml
import argparse
import numpy as np
from pathlib import Path
from termcolor import colored
from std_msgs.msg import Bool
from std_msgs.msg import Float32
from std_msgs.msg import Float64
import message_filters
from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type
from .agent import Agent
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped
from tf.transformations import euler_from_quaternion

flag_move = 0

def set_throttle_steer(odom: Odometry, msgradcam: MsgRadCam = None, msglidcam: MsgLidCam = None):

    global flag_move
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

    # publish the decisions
    # vehicle1
    vehicle1 = np.array([odom.pose.pose.position.x, odom.pose.pose.position.y])
    r, p, y = euler_from_quaternion([odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                                    odom.pose.pose.orientation.z, odom.pose.pose.orientation.w])
    steer, throttle = agent.set_control(vehicle1, y, msgradcam, msglidcam)
    throttle *= 15

    pub_vel_left_rear_wheel_1.publish(throttle)
    pub_vel_right_rear_wheel_1.publish(throttle)
    pub_vel_left_front_wheel_1.publish(throttle)
    pub_vel_right_front_wheel_1.publish(throttle)
    pub_pos_left_steering_hinge_1.publish(steer)
    pub_pos_right_steering_hinge_1.publish(steer)

    # vehicle2
    pub_vel_left_rear_wheel_2.publish(throttle)
    pub_vel_right_rear_wheel_2.publish(throttle)
    pub_vel_left_front_wheel_2.publish(throttle)
    pub_vel_right_front_wheel_2.publish(throttle)
    pub_pos_left_steering_hinge_2.publish(steer)
    pub_pos_right_steering_hinge_2.publish(steer)

def servo_commands():

    rospy.init_node('servo_commands', anonymous=True)

    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)

    sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
    sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odom = message_filters.Subscriber('/deepracer2/base_pose_ground_truth', Odometry)
    sync = message_filters.ApproximateTimeSynchronizer([sub_odom], 1, 1)
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
            print(colored('Config file could not be read.','red'))
            exit(1)

    agent = Agent(config['lanes']['obj_threshold'], config['lanes']['multi_threshold'], str(ROOT_DIR / config['lanes']['file_dir']))
    servo_commands()
