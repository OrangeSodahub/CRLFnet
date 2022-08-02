#!/usr/bin/env python3


import rospy
from ackermann_msgs.msg import AckermannDriveStamped
import sys, select, termios, tty


banner = """1. Reading from the keyboard  
2. Publishing to AckermannDriveStamped!
---------------------------
        w
   a    s    d
anything else : stop
CTRL-C to quit
"""


def getKey():
    tty.setraw(sys.stdin.fileno())
    select.select([sys.stdin], [], [], 0)
    key = sys.stdin.read(1)
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


def vels(speed, turn):
    return "currently:\tspeed %s\tturn %s " % (speed, turn)


if __name__ == "__main__":

    settings = termios.tcgetattr(sys.stdin)
    pub = rospy.Publisher("/ackermann_cmd_mux/output", AckermannDriveStamped, queue_size=1)
    rospy.init_node('keyop')

    speed = 0
    turn = 0
    state = 1.2
    ward = 1

    try:
        while True:
            key = getKey()
            if key == ' ':
                ward = 0
                turn = 0
            elif key == '1':
                state = 0.5
            elif key == '2':
                state = 1.5
            elif key == 'w':
                ward = 1
                turn = 0
            elif key == 's':
                ward = -1
                turn = 0
            elif key == 'a':
                ward = 1
                turn = 0.6
            elif key == 'd':
                ward = 1
                turn = -0.6
            elif key == '\x03':
                break
            
            speed = state * ward
            print("Speed: {}  ".format(speed), end='\r')
            
            msg = AckermannDriveStamped()
            msg.header.stamp = rospy.Time.now()
            msg.header.frame_id = "base_link"

            msg.drive.speed = speed
            msg.drive.acceleration = 1
            msg.drive.jerk = 1
            msg.drive.steering_angle = turn
            msg.drive.steering_angle_velocity = 1

            pub.publish(msg)

    except:
        print('error')

    finally:
        msg = AckermannDriveStamped()
        msg.header.stamp = rospy.Time.now()
        msg.header.frame_id = "base_link"
        msg.drive.speed = 0
        msg.drive.acceleration = 1
        msg.drive.jerk = 1
        msg.drive.steering_angle = 0
        msg.drive.steering_angle_velocity = 1
        pub.publish(msg)
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
