#!/usr/bin/python3
"""
    control deepracer1 mannually.
"""
import rospy
from std_msgs.msg import Bool
from std_msgs.msg import Float32
from std_msgs.msg import Float64
import message_filters
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped

flag_move = 0

def set_throttle_steer(key: AckermannDriveStamped, odom: Odometry):

    global flag_move
    throttle = key.drive.speed*13.95348
    steer = key.drive.steering_angle

    pub_vel_left_rear_wheel_1 = rospy.Publisher('/deepracer1/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_1 = rospy.Publisher('/deepracer1/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_1 = rospy.Publisher('/deepracer1/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_1 = rospy.Publisher('/deepracer1/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_1 = rospy.Publisher('/deepracer1/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_1 = rospy.Publisher('/deepracer1/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    # vehicle1
    pub_vel_left_rear_wheel_1.publish(throttle)
    pub_vel_right_rear_wheel_1.publish(throttle)
    pub_vel_left_front_wheel_1.publish(throttle)
    pub_vel_right_front_wheel_1.publish(throttle)
    pub_pos_left_steering_hinge_1.publish(steer)
    pub_pos_right_steering_hinge_1.publish(steer)

def servo_commands():

    rospy.init_node('servo_commands', anonymous=True)

    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)

    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odom = message_filters.Subscriber('/deepracer1/base_pose_ground_truth', Odometry)
    sync = message_filters.ApproximateTimeSynchronizer([sub_key, sub_odom], 1, 1)
    sync.registerCallback(set_throttle_steer)
    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    try:
        servo_commands()
    except rospy.ROSInterruptException:
        pass
