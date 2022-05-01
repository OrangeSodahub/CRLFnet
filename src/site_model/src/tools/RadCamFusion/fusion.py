#!/usr/bin/env python3

#############################################################
#   This py file get the radar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################

import argparse
import numpy as np
import parser
import yaml
import os
import rospy
import cv2
import message_filters
from termcolor import colored
from cv_bridge import CvBridge
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

global counter
counter = 0
def fusion(radar: MsgRadar, image2: Image, image3: Image):
    global yolo

    print("+------------------+")

    # radar_roi
    (x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right,
    x_pixels_left_1, x_pixels_left_2, x_pixels_right_1, x_pixels_right_2) = radar_roi.radar_roi(config, radar, image2.height, image2.width,
                                                                                                               image3.height, image3.width)
    # image_roi
    print("  Image 2: ", end='')
    labels_left = image_roi.image_roi(image2, yolo=yolo)
    print("  Image 3: ", end='')
    labels_right = image_roi.image_roi(image3, yolo=yolo)

    # fusion
    match_left = [[]]
    radar_left_single = [[]]
    image_left_single = [[]]
    match_right = [[]]
    radar_right_single = [[]]
    image_right_single = [[]]
    ## left
    if radar.total_vehicles_left!=0 and len(labels_left[0])!=0: # empty 2-dimention array has a size of 1
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
                match_obj = [match_left1, match_left2, image_left[2], image_left[3], score] # match succeeded
                match_left.append(match_obj)
                x_pixels_left_1.remove(radar_left1)
                x_pixels_left_2.remove(radar_left2)
                labels_left.remove(image_left)
    if radar.total_vehicles_left == 0 and len(labels_left[0]) != 0:
        image_left_single = labels_left
    if radar.total_vehicles_left != 0 and len(labels_left[0]) == 0:
        radar_left_single = [x_pixels_left_1, x_pixels_left_2]
    
    ## right
    if radar.total_vehicles_right!=0 and len(labels_right[0])!=0:
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

    # publish the results
    msgradcam = MsgRadCam()
    msgradcam.match_left = len(match_left[0])
    msgradcam.radar_left = len(radar_left_single[0])
    msgradcam.camera_left = len(image_left_single[0])
    msgradcam.match_right = len(match_right[0])
    msgradcam.radar_right = len(radar_right_single[0])
    msgradcam.camera_right = len(image_right_single[0])

    pub = rospy.Publisher("/radar_camera_fused", MsgRadCam)
    pub.publish(msgradcam)
    
    # draw
    if params.draw_output == True:
        if msgradcam.match_left+msgradcam.camera_left+msgradcam.radar_left!=0:
            # draw on image2
            draw_output(match_left, radar_left_single, image_left_single, image2, 'radar2/')
        if msgradcam.match_right+msgradcam.camera_right+msgradcam.radar_right!=0:
            # draw on image3
            draw_output(match_right, radar_right_single, image_right_single, image3, 'radar3/')


def draw_output(match: np.array(np.array(int)), radar: np.array(np.array(int)), camera: np.array(np.array(int)), image: Image, radar_name: str):
    output_dir = config['output']['RadCamFusion_dir']
    os.makedirs(output_dir, exist_ok=True)
    img = CvBridge().imgmsg_to_cv2(image, 'bgr8')
    # draw match
    if len(match[0])!=0: # empty match has a size of 1
        for obj_match in match:
            pt1 = (obj_match[0],obj_match[1])
            pt2 = (obj_match[2],obj_match[3])
            score = obj_match[4]
            cv2.rectangle(img, pt1, pt2, (0,255,0), 3)
            font = cv2.FONT_HERSHEY_SIMPLEX
            img = cv2.putText(img, '{} {:.3f}'.format(score), (100,100), font, 0.5, (0,255,255), 2)
    # draw radar
    if len(radar[0])!=0:
        num = len(radar[0])
        for i in range(num):
            pt1 = (radar[0][i],0)
            pt2 = (radar[1][i],image.height-1)
            cv2.rectangle(img, pt1, pt2, (255,0,0), 3)
    # draw camera
    if len(camera[0])!=0:
        for obj_img in camera:
            pt1 = (obj_img[0],obj_match[1])
            pt2 = (obj_img[2],obj_match[3])
            cv2.rectangle(img, pt1, pt2, (0,0,255), 3)

    # if drawn == True:
    global counter
    cv2.imwrite(output_dir+radar_name+'image_'+str(counter)+'.jpg', img)
    counter += 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default="/home/zzy/CRLFnet/src/site_model/config/config.yaml")
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

    yolo = YOLO()   # initialize yolo here, ONLY ONCE!!!
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_radar, sub_image_2, sub_image_3], 1, 1) # syncronize time stamps
    sync.registerCallback(fusion)
    print("Radar Camera Fusion Begin.")
    rospy.spin()
