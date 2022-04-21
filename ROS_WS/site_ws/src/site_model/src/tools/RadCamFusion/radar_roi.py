#############################################################
#   This py file generate the roi of radar detection.       #
#   Author: Yangxiuyu                                       #
#############################################################

import numpy as np
from tomlkit import string
import rospy
from termcolor import colored
import cv2
import os
# radar message type
from radar_msgs.msg._MsgRadar import *

def radar_roi(config: dict, radar_msgs: MsgRadar):
    # get calib parameters
    calib_dir = config['calib']['calib_dir']
    calib = np.loadtxt(calib_dir+'calib.txt')

    # get radar pts
    num_left = radar_msgs.total_vehicles_left # num of vechicles
    num_right = radar_msgs.total_vehicles_right

    # left
    x_pixels_left = []
    y_pixels_left = []
    for i in range(round(num_left)):
        # get pixel points
        x_pose = radar_msgs.ObjectList_left[i].obj_vcs_posex
        y_pose = radar_msgs.ObjectList_left[i].obj_vcs_posey
        world_pose = [[x_pose],[y_pose],[0.46],[1]] # 0.46 is preset
        pixel_pose = get_pixel_pose(calib,"pole2","camera2",world_pose)
        print("pixel_pose_left:")
        print(pixel_pose)

        # location of detection on the image unit pixel
        x_pixel = round(pixel_pose[0][0])
        y_pixel = round(pixel_pose[1][0])
        x_pixels_left.append(x_pixel)
        y_pixels_left.append(y_pixel)

    # right
    x_pixels_right = []
    y_pixels_right = []
    for i in range(round(num_right)):
        # get pixel points
        x_pose = radar_msgs.ObjectList_right[i].obj_vcs_posex
        y_pose = radar_msgs.ObjectList_right[i].obj_vcs_posey
        world_pose = [[x_pose],[y_pose],[0.46],[1]]
        pixel_pose = get_pixel_pose(calib,"pole3","camera3",world_pose)
        print("pixel_pose_right:")
        print(pixel_pose)

        # location of detection on the image unit pixel
        x_pixel = round(pixel_pose[0][0])
        y_pixel = round(pixel_pose[1][0])
        x_pixels_right.append(x_pixel)
        y_pixels_right.append(y_pixel)

    return x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right

def get_pixel_pose(calib: np.array, pole_name: string, camera_name: string, world_pose: np.array):
    """
        world_pose -> camera_pose : external parameter of camera
        camera_pose -> pixel_pose : internal parameter of camera
        tips: shift is need between external and internal parameter
    """
    # get external and internal parameter of camera
    world_to_camera = calib[4][1:17].reshape(4,4)
    camera_to_pixel = calib[4][17:30].reshape(3,4)

    # coordinates in camera coordinates
    camera_pose = np.matmul(world_to_camera, world_pose)
    instance = camera_pose[0]
    
    # shift the coordinates
    camera_pose_shift = [camera_pose[1],
                        camera_pose[2],
                       -camera_pose[0],
                       -instance] / (-instance)

    # coordinates in pixel coordinates
    pixel_pose = np.matmul(camera_to_pixel, camera_pose_shift)

    return pixel_pose