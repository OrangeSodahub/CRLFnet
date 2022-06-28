#!/usr/bin/env python3

#############################################################
#   This py file get the radar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################

import argparse
import numpy as np
import parser
import yaml
import rospy
import message_filters
from termcolor import colored
# camera message type
from sensor_msgs.msg import Image
# radar message type
from msgs.msg._MsgRadar import *
# radar roi generate
import radar_roi
# image detection
import image_roi
# yolo
from yolo.yolo import YOLO
# fusion message type
from msgs.msg._MsgRadCam import *
# visualization
from utils import visualization

def fusion(radar: MsgRadar, image2: Image, image3: Image):
    global yolo

    print("+------------------+")

    # radar_roi
    (x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right,
    x_pixels_left_1, x_pixels_left_2, x_pixels_right_1, x_pixels_right_2) = radar_roi.radar_roi(ROOT_DIR, config, radar, image2.height, image2.width,
                                                                                                               image3.height, image3.width)
    # image_roi
    print("  Image 2: ", end='')
    labels_left = []
    labels_left.append(image_roi.image_roi(image2, yolo=yolo))
    labels_left = np.array(labels_left) # convert to numpy array
    print("  Image 3: ", end='')
    labels_right = []
    labels_right.append(image_roi.image_roi(image3, yolo=yolo))
    labels_right = np.array(labels_right)

    # fusion
    match_left = []
    radar_left_single = [[]]
    image_left_single = [[]]
    match_right = []
    radar_right_single = [[]]
    image_right_single = [[]]
    ## left
    if radar.total_vehicles_left!=0 and len(labels_left[0])!=1: # empty 2-dimention array has a size of 1
        print("labels_left:"+str(len(labels_left)))
        for radar_left1, radar_left2 in zip(x_pixels_left_1, x_pixels_left_2):
            for image_left in labels_left:
                match_left1 = max(radar_left1,image_left[0])
                match_left2 = min(radar_left2,image_left[0])
                if(match_left1>=match_left2): # match failed
                    continue
                iou_left = (match_left2-match_left1)*(image_left[1]-image_left[3])
                area_left = (image_left[2]-image_left[0])*(image_left[1]-image_left[3])
                score = iou_left / area_left
                if(score<0.7): # match failed
                    continue
                match_obj = np.array([match_left1, match_left2, image_left[2], image_left[3], score]) # match succeeded
                match_left.append(match_obj)
                x_pixels_left_1.remove(radar_left1)
                x_pixels_left_2.remove(radar_left2)
                labels_left.remove(image_left)
    if radar.total_vehicles_left == 0 and len(labels_left[0]) != 0:
        image_left_single = labels_left
    if radar.total_vehicles_left != 0 and len(labels_left[0]) == 0:
        radar_left_single = [x_pixels_left_1, x_pixels_left_2]
    match_left = np.array(match_left)
    image_left_single = np.array(image_left_single)
    radar_left_single = np.array(radar_left_single)
    
    ## right
    if radar.total_vehicles_right!=0 and len(labels_right[0])!=1:
        for radar_right1, radar_right2 in zip(x_pixels_right_1, x_pixels_right_2):
            for image_right in labels_right:
                match_right1 = max(radar_right1,image_right[0])
                match_right2 = min(radar_right2,image_right[0])
                if(match_right1>=match_right2): # match failed
                    continue
                iou_right = (match_right2-match_right1)*(image_right[1]-image_right[3])
                area_right = (image_right[2]-image_right[0])*(image_right[1]-image_right[3])
                score = iou_right / area_right
                if(score<0.7): # match failed
                    continue
                match_obj = [match_right1, match_right2, image_right[2], image_right[3], score] # match succeeded
                match_right.append(match_obj)
                x_pixels_right_1.remove(radar_right1)
                x_pixels_right_2.remove(radar_right2)
                labels_right.remove(image_right)
    if radar.total_vehicles_right==0 and len(labels_right[0])!=0:
        image_right_single = labels_right
    if radar.total_vehicles_right!=0 and len(labels_right[0])==0:
        radar_right_single = [x_pixels_right_1, x_pixels_right_2]
    match_right = np.array(match_right)
    image_right_single = np.array(image_right_single)
    radar_right_single = np.array(radar_right_single)

    # publish the results
    msgradcam = MsgRadCam()
    msgradcam.match_left = len(match_left[0]) if len(match_left)!=0 else 0
    msgradcam.radar_left = len(radar_left_single[0])
    msgradcam.camera_left = len(image_left_single[0])
    msgradcam.match_right = len(match_right[0]) if len(match_left)!=0 else 0
    msgradcam.radar_right = len(radar_right_single[0])
    msgradcam.camera_right = len(image_right_single[0])
    msgradcam.header.stamp = rospy.Time.now()

    pub = rospy.Publisher("/radar_camera_fused", MsgRadCam)
    pub.publish(msgradcam)
    
    # draw radar points on photos
    if params.draw_output == True:
        output_dir = ROOT_DIR + config['output']['RadCamFusion_dir']
        if msgradcam.match_left+msgradcam.camera_left+msgradcam.radar_left!=0:
            # draw on image2
            visualization.radar2visual(match_left, radar_left_single, image_left_single, image2, 'radar2/', output_dir)
        if msgradcam.match_right+msgradcam.camera_right+msgradcam.radar_right!=0:
            # draw on image3
            visualization.radar2visual(match_right, radar_right_single, image_right_single, image3, 'radar3/', output_dir)

    # For test
    # if len(labels_left[0]) != 1:
    #     output_dir = ROOT_DIR + config['output']['RadCamFusion_dir']
    #     visualization.radar2visual([[]], [x_pixels_left_1, x_pixels_left_2], labels_left, image2, 'radar2/', output_dir)


if __name__ == '__main__':
    # get root path
    from pathlib import Path
    ROOT_DIR = str((Path(__file__).resolve().parent / '../../../').resolve())
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= ROOT_DIR + '/config/config.yaml')
    parser.add_argument("--draw_output", help="wehter to draw rois and output", action='store_true', required=False)
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

    yolo = YOLO()   # initialize yolo here, ONLY ONCE!!!
    print("YOLO created.")
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_radar, sub_image_2, sub_image_3], 1, 1) # syncronize time stamps
    sync.registerCallback(fusion)
    print("Radar Camera Fusion Begin.")
    rospy.spin()
