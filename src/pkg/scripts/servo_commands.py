#!/usr/bin/python3
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

    pub_vel_left_rear_wheel_5 = rospy.Publisher('/deepracer5/left_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_rear_wheel_5 = rospy.Publisher('/deepracer5/right_rear_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_left_front_wheel_5 = rospy.Publisher('/deepracer5/left_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_vel_right_front_wheel_5 = rospy.Publisher('/deepracer5/right_front_wheel_velocity_controller/command', Float64, queue_size=1)
    pub_pos_left_steering_hinge_5 = rospy.Publisher('/deepracer5/left_steering_hinge_position_controller/command', Float64, queue_size=1)
    pub_pos_right_steering_hinge_5 = rospy.Publisher('/deepracer5/right_steering_hinge_position_controller/command', Float64, queue_size=1)

    # vehicle1
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

    # vehicle3
    pub_vel_left_rear_wheel_3.publish(throttle)
    pub_vel_right_rear_wheel_3.publish(throttle)
    pub_vel_left_front_wheel_3.publish(throttle)
    pub_vel_right_front_wheel_3.publish(throttle)
    pub_pos_left_steering_hinge_3.publish(steer)
    pub_pos_right_steering_hinge_3.publish(steer)

    # vehicle4
    pub_vel_left_rear_wheel_4.publish(throttle)
    pub_vel_right_rear_wheel_4.publish(throttle)
    pub_vel_left_front_wheel_4.publish(throttle)
    pub_vel_right_front_wheel_4.publish(throttle)
    pub_pos_left_steering_hinge_4.publish(steer)
    pub_pos_right_steering_hinge_4.publish(steer)

    # vehicle5
    pub_vel_left_rear_wheel_5.publish(throttle)
    pub_vel_right_rear_wheel_5.publish(throttle)
    pub_vel_left_front_wheel_5.publish(throttle)
    pub_vel_right_front_wheel_5.publish(throttle)
    pub_pos_left_steering_hinge_5.publish(steer)
    pub_pos_right_steering_hinge_5.publish(steer)

def servo_commands():

    rospy.init_node('servo_commands', anonymous=True)

    # rospy.Subscriber("/ackermann_cmd_mux/output", AckermannDriveStamped, set_throttle_steer)

    sub_key = message_filters.Subscriber('/ackermann_cmd_mux/output', AckermannDriveStamped)
    sub_odom = message_filters.Subscriber('/deepracer2/base_pose_ground_truth', Odometry)
    sync = message_filters.ApproximateTimeSynchronizer([sub_key, sub_odom], 1, 1)
    sync.registerCallback(set_throttle_steer)
    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    try:
        servo_commands()
    except rospy.ROSInterruptException:
        pass
