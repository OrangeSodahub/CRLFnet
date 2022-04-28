#############################################################
#   This py file get the lidar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################

import argparse
import numpy as np
import parser
import yaml
import os
import rospy
from termcolor import colored
import message_filters
# pointcloud type
from sensor_msgs.msg import PointCloud2
# Image type
from camera_msgs.msg._MsgCamera import * # camera msgs class
# Object Detection tool
import OpenPCDet.tools

def fusion(pointcloud, image):
    # image roi
    print(image.header)

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

    rospy.init_node('lidar_camera_fusion', anonymous=True)

    sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera], 10, 1)# syncronize time stamps
    sync.registerCallback(fusion)
    print("Lidar Camera Fusion Begin.")
    rospy.spin()