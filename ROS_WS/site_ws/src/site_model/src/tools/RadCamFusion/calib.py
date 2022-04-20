#############################################################
#   This py file caculate the calibration matrix            #
#   Author: Yangxiuyu                                       #
#############################################################

import math
import numpy as np
from tomlkit import string

# transform matrix
def world_to_pixel(config: dict, pole_name: string, camera_name: string, world_pose: np.array):
    """
        input: world_pose
        output: pixel_pose
        process: world_pose->pole_pose->camera_pose->pixel_pose
        tips: camera_pose->pixel_pose
              need to shift the camera_coordinates
    """
    world_to_camera_ = world_to_camera(config,pole_name,camera_name)
    camera_to_pixel_ = camera_to_pixel(config,camera_name)

    # caculate the transfrom matrix
    world_to_pixel_ = np.matmul(camera_to_pixel_,world_to_camera_)
    # print("world_to_pixel:")
    # print(world_to_pixel_)

    # coordinates in camera coordinates
    camera_coordinates = np.matmul(world_to_camera_, world_pose)
    instance = camera_coordinates[0]
    camera_coordinates_shift = [camera_coordinates[1],
                                camera_coordinates[2],
                               -camera_coordinates[0],
                               -instance] / (-instance)
    
    # corrdinates in pixel coordinates
    pixel_pose = np.matmul(camera_to_pixel_, camera_coordinates_shift)

    return pixel_pose

# camera external parameter matrix
def world_to_camera(config: dict, pole_name: string, camera_name: string):
    """
        world_to_camera = pose_to_camera * world_to_camera
    """
    pole = config['calib']['pole_pose'][pole_name]
    camera = config['calib']['camera_pose'][camera_name]

    world_to_pole = RTmatrix(pole)
    pole_to_camera = RTmatrix(camera)
    world_to_camera_ = np.matmul(pole_to_camera,world_to_pole) # Wrong: world_to_Pole * pole_to_camera

    # test
    # world_pose = [[-1.59824637808195],[-0.790114867663065],[0.461],[1]]
    # print("********************")
    # print(np.matmul(world_to_pole,world_pose))
    # print("********************")
    # pole_pose = [[0],[0],[1],[1]]
    # print("********************")
    # print(np.matmul(pole_to_camera,pole_pose))
    # print("********************")

    # print("world_to_pole:")
    # print(world_to_pole)
    # print("pole_to_camera:")
    # print(pole_to_camera)
    # print("world_to_camera")
    # print(world_to_camera_)

    return world_to_camera_

def RTmatrix(pose):
    """
        caculate the external parameter matrix of camera:
        R = Rz * Ry * Rx
        tips: need to inverse the matrix R
    """
    # Translation matrix
    T = [[pose[0]],[pose[1]],[pose[2]]]

    # Roatation matrix
    r_angle = pose[3]
    p_angle = pose[4]
    y_angle = pose[5]
    
    Rx = [[1                 ,0                ,0],
            [0,math.cos(r_angle),-math.sin(r_angle)],
            [0,math.sin(r_angle),math.cos(r_angle)]]
    Ry = [[math.cos(p_angle),0,math.sin(p_angle)],
            [0,               1,               0],
            [-math.sin(p_angle),0,math.cos(p_angle)]]
    Rz = [[math.cos(y_angle),-math.sin(y_angle),0],
            [math.sin(y_angle),math.cos(y_angle),0],
            [0                ,0                ,1]]

    R = np.matmul(Rz,np.matmul(Ry,Rx)) # Wrong:R=RxRyRz

    # RTmatrix 
    O1 = np.transpose([[0],[0],[0],[1]])
    RT = np.append(R,T,axis=1)
    result = np.append(RT,O1,axis=0)

    # Inverse the matrix
    result = np.linalg.inv(result)

    return result

def camera_to_pixel(config: dict, camera_name: string):
    """
        get the internal parameter matrix of camera (fixed)
    """
    camera_info_dir = config['calib']['camera_info_dir']
    K = np.loadtxt(camera_info_dir+'camera_info.txt')[4][28:40]
    K = K.reshape(3,4)
    # print("camera_to_pixel:")
    # print(K)

    return K
