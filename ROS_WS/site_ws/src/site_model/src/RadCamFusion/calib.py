#############################################################
#   This py file caculate the calibration matrix            #
#   Author: Yangxiuyu                                       #
#############################################################

import math
import numpy as np
from tomlkit import string

# transform matrix
def world_to_pixel(config: dict, pole_name: string, camera_name: string, x: int, y: int):
    instance, world_to_camera_ = world_to_camera(config,pole_name,camera_name, x, y)
    camera_to_pixel_ = camera_to_pixel(config,camera_name)

    world_to_pixel_ = np.matmul(camera_to_pixel_,world_to_camera_)
    print("world_to_pixel:")
    print(world_to_pixel_)

    return instance, world_to_pixel_

# camera external parameter matrix
def world_to_camera(config: dict, pole_name: string, camera_name: string, x: int, y: int):
    pole = config['calib']['pole_pose'][pole_name]
    camera = config['calib']['camera_pose'][camera_name]

    world_to_pole = RTmatrix(pole)
    pole_to_camera = RTmatrix(camera)
    world_to_camera_ = np.matmul(world_to_pole,pole_to_camera)

    # caculate the absolute coordinate x of camera and instance
    instance = y - (-1.250682844)
    
    print("world_to_camera")
    print(world_to_camera_)
    return instance, world_to_camera_

def RTmatrix(pose):
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

    return result

# use the internal parameter matrix of camera
def camera_to_pixel(config: dict, camera_name: string):
    camera_info_dir = config['calib']['camera_info_dir']
    K = np.loadtxt(camera_info_dir+'camera_info.txt')[4][28:40]
    K = K.reshape(3,4)
    print("internal parameter:")
    print(K)

    return K
