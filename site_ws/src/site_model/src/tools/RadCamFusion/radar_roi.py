#############################################################
#   This py file generate the roi of radar detection.       #
#   Author: Yangxiuyu                                       #
#############################################################

import numpy as np
from torch import det
# radar message type
from msgs.msg._MsgRadar import *

def radar_roi(config: dict, radar_msgs: MsgRadar, height2: int, width2: int, height3: int, width3: int):
    # get calib parameters
    calib_dir = config['calib']['calib_dir']
    calib = np.loadtxt(calib_dir+'calib.txt')

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
        world_pose = [[x_pose],[y_pose],[0.46],[1]] # 0.46 is preset
        world_pose_1 = [[x_pose-0.11],[y_pose],[y_pose],[0.46],[1]] # 0.11 is preset
        world_pose_2 = [[x_pose+0.11],[y_pose],[y_pose],[0.46],[1]]
        pixel_pose = get_pixel_pose(calib,"camera2",world_pose)
        pixel_pose_1 = get_pixel_pose(calib,"camera2",world_pose_1)
        pixel_pose_2 = get_pixel_pose(calib,"camera2",world_pose_2)
        # print("pixel_pose_left:")
        # print(pixel_pose)

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
        world_pose = [[x_pose],[y_pose],[0.46],[1]]
        world_pose_1 = [[x_pose-0.11],[y_pose],[y_pose],[0.46],[1]]
        world_pose_2 = [[x_pose+0.11],[y_pose],[y_pose],[0.46],[1]]
        pixel_pose = get_pixel_pose(calib,"camera3",world_pose)
        pixel_pose_1 = get_pixel_pose(calib,"camera3",world_pose_1)
        pixel_pose_2 = get_pixel_pose(calib,"camera3",world_pose_2)
        # print("pixel_pose_right:")
        # print(pixel_pose)

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

def get_pixel_pose(calib: np.array, camera_name: str, world_pose: np.array):
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

def boundary_detection(obj:int, low: int, upper: int):
    if obj < low:
        obj = low
    if obj > upper:
        obj = upper
    return obj