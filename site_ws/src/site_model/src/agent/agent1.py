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

def main():
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

    sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera], 10, 1)# syncronize time stamps
    sync.registerCallback(main)
    print("Lidar Camera Fusion Begin.")
    rospy.spin()