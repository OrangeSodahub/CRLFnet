#!/usr/bin/env python3

#############################################################
#   This py file generate the roi of radar detection.       #
#   Author: Yangxiuyu                                       #
#############################################################

import os
import numpy as np
import sys
# radar message type
from msgs.msg._MsgRadar import *
# transform coordinates tool
sys.path.append("../../")
from utils import transform

def radar_roi(config: dict, radar_msgs: MsgRadar, height2: int, width2: int, height3: int, width3: int):
    # get calib parameters
    calib_dir = config['calib']['calib_dir']
    calib = np.loadtxt(os.path.join(calib_dir, 'calib.txt'))

    # get radar pts
    num_left = radar_msgs.total_vehicles_left # num of vechicles
    num_right = radar_msgs.total_vehicles_right

    # left
    x_pixels_left = []
    y_pixels_left = []
    x_pixels_left_1 = []
    x_pixels_left_2 = []
    for i in range(round(num_left)):
        # get pixel points
        x_pose = radar_msgs.ObjectList_left[i].obj_vcs_posex
        y_pose = radar_msgs.ObjectList_left[i].obj_vcs_posey
        world_pose = [[[x_pose],[y_pose],[0.46],[1]],
                        [[x_pose-0.11],[y_pose],[0.46],[1]],
                        [[x_pose+0.11],[y_pose],[0.46],[1]]]
        pixel_pose, pixel_pose_1, pixel_pose_2 = transform.radar2pixel(calib, "camera2", world_pose)

        # location of detection on the image unit pixel
        cur_x_pixels_left = boundary_detection(pixel_pose[0][0],0,width3)
        cur_y_pixels_left = boundary_detection(pixel_pose[1][0],0,height3)
        cur_x_pixels_left_1 = boundary_detection(pixel_pose_1[0][0],0,width3)
        cur_x_pixels_left_2 = boundary_detection(pixel_pose_2[0][0],0,width3)
        x_pixels_left.append(round(cur_x_pixels_left))
        y_pixels_left.append(round(cur_y_pixels_left))
        x_pixels_left_1.append(round(cur_x_pixels_left_1))
        x_pixels_left_2.append(round(cur_x_pixels_left_2))

    # right
    x_pixels_right = []
    y_pixels_right = []
    x_pixels_right_1 = []
    x_pixels_right_2 = []
    for i in range(round(num_right)):
        # get pixel points
        x_pose = radar_msgs.ObjectList_right[i].obj_vcs_posex
        y_pose = radar_msgs.ObjectList_right[i].obj_vcs_posey
        world_pose = [[[x_pose],[y_pose],[0.46],[1]],
                [[x_pose-0.11],[y_pose],[0.46],[1]],
                [[x_pose+0.11],[y_pose],[0.46],[1]]]
        pixel_pose, pixel_pose_1, pixel_pose_2 = transform.radar2pixel(calib, "camera2", world_pose)

        # location of detection on the image unit pixel
        cur_x_pixels_right = boundary_detection(pixel_pose[0][0],0,width3)
        cur_y_pixels_right = boundary_detection(pixel_pose[1][0],0,height3)
        cur_x_pixels_right_1 = boundary_detection(pixel_pose_1[0][0],0,width3)
        cur_x_pixels_right_2 = boundary_detection(pixel_pose_2[0][0],0,width3)
        x_pixels_right.append(round(cur_x_pixels_right))
        y_pixels_right.append(round(cur_y_pixels_right))
        x_pixels_right_1.append(round(cur_x_pixels_right_1))
        x_pixels_right_2.append(round(cur_x_pixels_right_2))

    return (x_pixels_left, y_pixels_left, x_pixels_right, y_pixels_right,
            x_pixels_left_1, x_pixels_left_2, x_pixels_right_1, x_pixels_right_2)


def boundary_detection(obj:int, low: int, upper: int):
    if obj < low:
        obj = low
    if obj > upper:
        obj = upper
    return obj
