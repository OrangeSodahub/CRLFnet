#!/usr/bin/env python3

#############################################################
#   This py file generate the roi of lidar detection.       #
#   Author: Yangxiuyu                                       #
#############################################################

import os
from pathlib import Path
import numpy as np
# radar message type
from msgs.msg._MsgRadar import *
# transform coordinates tool
from ..utils.transform import which_cameras, box_to_corner_3d, lidar2pixel

def pointcloud_roi(ROOT_DIR: Path, config: dict, boxes_3d: np.array(np.array)):
    """
    boxes_3d: [[],[],[],...]
    cameras: [[],[],[],...]
    corners3d: [[[],[],[],[],[],[],[],[]],
                [[],[],[],[],[],[],[],[]],...]
                each [[],[],[],[],[],[],[],[]] -> one vehicle
                each [] -> one point, 3-dimension
    world_pose: [[],[],[],[],[],[],[],[]]
    pixel_pose: [[[[],[],[],[],[],[],[],[]],]
                [[[],[],[],[],[],[],[],[]],]...]
    """

    # get calib parameters
    calib_dir = str(ROOT_DIR.joinpath(config['calib']['calib_dir']))
    calib = np.loadtxt(os.path.join(calib_dir, 'calib.txt'))
    
    # For all vehicles: get corresponding cameras and 8-point coords in world coord
    cameras = which_cameras(boxes_3d)
    corners3d = box_to_corner_3d(boxes_3d)

    # label2camera
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }

    # For each vehicle: transform 3d-coord to 2d and save to .png
    pixel_pose = []
    global vehicle_num
    vehicle_num = -1
    for camera, world_pose in zip(cameras, corners3d):
        pixel_pose.append([]) # add new vehicle
        vehicle_num += 1
        for camera_label in camera:
            camera_name = label2camera[camera_label]
            pixel_pose_single_img = lidar2pixel(calib, camera_name, world_pose)
            pixel_pose[vehicle_num].append(pixel_pose_single_img)

    return cameras, corners3d, pixel_pose