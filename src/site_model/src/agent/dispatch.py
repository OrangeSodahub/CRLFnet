#!/usr/bin/python3
import rospy
import argparse
import yaml
from pathlib import Path
from termcolor import colored
from ackermann_msgs.msg import AckermannDriveStamped
from .agent import Agent
import sys, select, termios, tty

keyBindings = {
    'x':(0,0)
}

def get_key():
   tty.setraw(sys.stdin.fileno())
   select.select([sys.stdin], [], [], 0)
   key = sys.stdin.read(1)
   termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
   return key

speed = 1.5
turn = 0.6


def vels(speed, turn):
    return "currently:\tspeed %s\tturn %s " % (speed,turn)


if __name__=="__main__":
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]

    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= str(ROOT_DIR.joinpath("config/config.yaml")))
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    settings = termios.tcgetattr(sys.stdin)
    pub = rospy.Publisher("/ackermann_cmd_mux/output", AckermannDriveStamped, queue_size=1)
    rospy.init_node('/agent_dispatch')

    x = 0
    th = 0
    status = 0

    # initialize the agent
    agent = Agent(config)

    try:
        while True:
            key = get_key()
            if key in keyBindings.keys():
                x = keyBindings[key][0]
                th = keyBindings[key][1]
            else:
                x = 1
                th =1
                if key == '\x03':
                    break
    
            msg = AckermannDriveStamped()
            msg.header.stamp = rospy.Time.now()
            msg.header.frame_id = 'base_link'

            msg.drive.speed = x*speed
            msg.drive.acceleration = 1
            msg.drive.jerk = 1
            msg.drive.steering_angle = th*turn
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
