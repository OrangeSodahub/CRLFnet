#############################################################
#   This py file acts as agent representing the overhead.   #
#############################################################

import argparse
import numpy as np
import parser
import yaml
import rospy
from termcolor import colored
import message_filters
# radar camera fusion message type
from msgs.msg._MsgRadCam import *
# lidar camera fusion message type
from msgs.msg._MsgLidCam import *

def main(msgradcam: MsgRadCam, msglidcam: MsgLidCam):
    print("Agent One Set.")

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default="/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/config/config.yaml")
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    rospy.init_node('agent_one', anonymous=True)

    sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
    sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_msgradcam, sub_msglidcam], 1, 1)# syncronize time stamps
    sync.registerCallback(main)
    print("Agent Set.")
    rospy.spin()