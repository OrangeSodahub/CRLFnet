import numpy as np
import os
import datetime
# camera message type
from sensor_msgs.msg import Image
# Image type
from msgs.msg._MsgCamera import * # camera msgs class
from cv_bridge import CvBridge
import cv2
from . import transform

def radar2visual(match: np.array(np.array(int)), radar: np.array(np.array(int)), camera: np.array(np.array(int)), image: Image, radar_name: str, output_dir: str):
    os.makedirs(output_dir, exist_ok=True)
    img = CvBridge().imgmsg_to_cv2(image, 'bgr8')

    # draw match
    if len(match)!=0:
        for obj_match in match:
            pt1 = (obj_match[0],obj_match[1])
            pt2 = (obj_match[2],obj_match[3])
            score = obj_match[4]
            cv2.rectangle(img, pt1, pt2, (0,255,0), 3)
            font = cv2.FONT_HERSHEY_SIMPLEX
            img = cv2.putText(img, '{} {:.3f}'.format(score), (100,100), font, 0.5, (0,255,255), 2)
    # draw radar
    if len(radar[0])!=1: # empty match has a size of 1
        num = len(radar[0])
        for i in range(num):
            pt1 = (radar[0][i],0)
            pt2 = (radar[1][i],image.height-1)
            cv2.rectangle(img, pt1, pt2, (255,0,0), 3)
    # draw camera
    if len(camera[0])!=1:
        for obj_img in camera:
            pt1 = (obj_img[0],obj_img[1])
            pt2 = (obj_img[2],obj_img[3])
            cv2.rectangle(img, pt1, pt2, (0,0,255), 3)

    # save images
    img_file = output_dir + radar_name + ('image_%s.jpg' % datetime.datetime.now().strftime('%Y%m%d-%H%M%S'))
    print(img_file, "saved.")
    cv2.imwrite(img_file, img)

def lidar2visual():
    pass