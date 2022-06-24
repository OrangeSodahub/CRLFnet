#!/usr/bin/env python3

#############################################################
#   This py file get the lidar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################

import argparse
import parser
import yaml
import rospy
from termcolor import colored
import message_filters
# pointcloud type
from sensor_msgs.msg import PointCloud2
import ros_numpy
# Image type
from msgs.msg._MsgCamera import * # camera msgs class
# Object Detection tool
from OpenPCDet.tools.pred import *
# fusion message type
# from msgs.msg._MsgLidCam import *

def fusion(pointcloud, image):
    assert isinstance(pointcloud, PointCloud2)
    assert isinstance(image, MsgCamera)
    # image roi

    # pointcloud roi
    pc = ros_numpy.numpify(pointcloud)
    points = np.zeros((pc.shape[0],4))
    points[:,0] = pc['x']
    points[:,1] = pc['y']
    points[:,2] = pc['z']
    pointcloud_detector.get_pred_dicts(points)

    # fusion
    # msglidcam = MsgLidCam()
    # msglidcam.header.stamp = rospy.Time.now()

    # publish result
    # pub = rospy.Publisher("/lidar_camera_fused", MsgLidCam)
    # pub.publish(msglidcam)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default="/home/zonlin/CRLFnet/src/site_model/config/config.yaml")
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    rospy.init_node('lidar_camera_fusion', anonymous=True)
    # Create an example of pointcloud detector
    pointcloud_detector = RT_Pred()
    # Create YOLO detector

    sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera], 1, 1)# syncronize time stamps
    sync.registerCallback(fusion)
    print("Lidar Camera Fusion Begin.")
    rospy.spin()
