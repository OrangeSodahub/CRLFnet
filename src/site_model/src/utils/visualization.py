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

def lidar2visual(cameras: np.array, pixel_poses, msgcamera: MsgCamera, output_dir: str):
    """
        cameras: [[camera1, camera2, ...],[camera1, camera2, ...], ...] -> each [camera1, camera2,...] represents a vehicle
        pixel_poses: [[vehicle1], [vehicle2], ...]
            vehicle: [camera1, camera2, ...]
            camera:  [[x1 x2 y1 y2], [x1 x2 y1 y2], [], ...]
                     -> each [x1 x2 y1 y2] reprensents 4 coordinates of a point and  there are 8 points
    """
    os.makedirs(output_dir, exist_ok=True)

    # label2camera
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }

    for camera, pixel_pose in zip(cameras, pixel_poses):
        # process single image
        for camera_label, pixel_pose_cur_camera in zip(camera, pixel_pose):
            img = msgcamera.camera[camera_label-1]
            img = CvBridge().imgmsg_to_cv2(img, 'bgr8')
            # get 8 pts
            pts1 = (round(pixel_pose_cur_camera[0][0]), round(pixel_pose_cur_camera[0][1]))
            pts2 = (round(pixel_pose_cur_camera[1][0]), round(pixel_pose_cur_camera[1][1]))
            pts3 = (round(pixel_pose_cur_camera[2][0]), round(pixel_pose_cur_camera[2][1]))
            pts4 = (round(pixel_pose_cur_camera[3][0]), round(pixel_pose_cur_camera[3][1]))
            pts5 = (round(pixel_pose_cur_camera[4][0]), round(pixel_pose_cur_camera[4][1]))
            pts6 = (round(pixel_pose_cur_camera[5][0]), round(pixel_pose_cur_camera[5][1]))
            pts7 = (round(pixel_pose_cur_camera[6][0]), round(pixel_pose_cur_camera[6][1]))
            pts8 = (round(pixel_pose_cur_camera[7][0]), round(pixel_pose_cur_camera[7][1]))

            # draw 12 lines
            cv2.line(img, pts1, pts2, (0,255,0), 2)
            cv2.line(img, pts2, pts3, (0,255,0), 2)
            cv2.line(img, pts3, pts4, (0,255,0), 2)
            cv2.line(img, pts4, pts1, (0,255,0), 2)

            cv2.line(img, pts5, pts6, (0,255,0), 2)
            cv2.line(img, pts6, pts7, (0,255,0), 2)
            cv2.line(img, pts7, pts8, (0,255,0), 2)
            cv2.line(img, pts8, pts5, (0,255,0), 2)

            cv2.line(img, pts1, pts5, (0,255,0), 2)
            cv2.line(img, pts2, pts6, (0,255,0), 2)
            cv2.line(img, pts3, pts7, (0,255,0), 2)
            cv2.line(img, pts4, pts8, (0,255,0), 2)

            # save images
            camera_name = label2camera[camera_label]
            img_file = output_dir + ('image_%s_' % datetime.datetime.now().strftime('%Y%m%d-%H%M%S') + camera_name + '.jpg')
            print(img_file, "saved.")
            cv2.imwrite(img_file, img)