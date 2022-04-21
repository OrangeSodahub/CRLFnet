#############################################################
#   This py file get the radar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#   Author: Yangxiuyu                                       #
#############################################################

import argparse
from typing import Counter
import numpy as np
import parser
import yaml
import os
import rospy, math, random, cv_bridge, cv2
import message_filters
from termcolor import colored
from cv_bridge import CvBridge,CvBridgeError
# camera message type
from sensor_msgs.msg import Image
# radar message type
from radar_msgs.msg._MsgRadar import *
# radar roi generate
import radar_roi

global counter
counter = 0
def fusion(radar, image2):
    print("image2:")
    print("image3:")
    print("radar:")

    # radar_roi
    x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right = radar_roi.radar_roi(config, radar)

    # image2_roi

    # image3_roi

    # draw
    # if params.draw_output == True:
    draw_output(x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right, image2)

def draw_output(x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right, image2: Image):
    output_dir = config['output']['RadCamFusion_dir']
    os.makedirs(output_dir, exist_ok=True)
    # left
    num_left = len(x_pixels_left)
    for i in range(num_left):
        img = CvBridge().imgmsg_to_cv2(image2, 'bgr8')
        # draw dot
        pt1 = (x_pixels_left[i]-2, y_pixels_left[i]-2)
        pt2 = (x_pixels_left[i]+2, y_pixels_left[i]+2)
        cv2.rectangle(img, pt1, pt2, (0,0,255), 3)
        # draw roi
        pt1 = (x_pixels_left[i]-50, 0)
        pt2 = (x_pixels_left[i]+50, 479)
        cv2.rectangle(img, pt1, pt2, (0,255,0), 1)

        label = 'vehicle'
        score = 0.49
        font = cv2.FONT_HERSHEY_SIMPLEX
        img = cv2.putText(img, '{} {:.3f}'.format(label,score), (100,100), font, 0.5, (0,255,255), 2)

    global counter
    cv2.imwrite(output_dir+'image2_'+str(counter)+'.jpg', img)
    counter += 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default="/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/config/config.yaml")
    parser.add_argument("--draw_output", help="wehter to draw rois and output", metavar="FILE", required=False, default=False)
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    rospy.init_node('radar_camera_fusion', anonymous=True)

    sub_radar = message_filters.Subscriber('/radar_msgs_combined', MsgRadar)
    sub_image_2 = message_filters.Subscriber('/image_raw_2', Image)
    sub_image_3 = message_filters.Subscriber('/image_raw_3', Image)
 
    sync = message_filters.TimeSynchronizer([sub_radar, sub_image_2], 10)# syncronize time stamps
    sync.registerCallback(fusion)
    print("Begin.")
    rospy.spin()