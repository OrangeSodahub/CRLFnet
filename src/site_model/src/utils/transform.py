#!/usr/bin/env python3

#############################################################
#                                                           #
#               Transorm the coordinates.                   #
#                                                           #
#############################################################

import numpy as np

def world2pixel(calib: np.array, camera_name: str, world_pose: np.array):
    """
        world_pose -> camera_pose : external parameter of camera
        camera_pose -> pixel_pose : internal parameter of camera
        tips: shift is need between external and internal parameter
    """
    # transform from camera name to camera number
    transform = {'camera2': 4,
                 'camera3': 5
                }
    # get external and internal parameter of camera
    world_to_camera = calib[transform[camera_name]][1:17].reshape(4,4)
    camera_to_pixel = calib[transform[camera_name]][17:30].reshape(3,4)

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


# three points
def radar2pixel(calib: np.array, camera_name: str, world_pose: np.array):
    pixel_pose = world2pixel(calib, camera_name, world_pose[0])
    pixel_pose_1 = world2pixel(calib, camera_name, world_pose[1])
    pixel_pose_2 = world2pixel(calib, camera_name, world_pose[2])
    
    return pixel_pose, pixel_pose_1, pixel_pose_2


# eight points
def lidar2pixel():
    
    pass