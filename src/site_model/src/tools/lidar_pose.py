#!/usr/bin/env python3

#############################################################
#   This py file caculate the pose of liders.               #
#   Author: Yangxiuyu                                       #
#############################################################

import math
import numpy as np

def main():
    # the transform matrix of pole1
    r_angle_pole1 = 1.5707963267949
    p_angle_pole1 = 0
    y_angle_pole1 = 0.785398163397456
    # the transform matrix of pole4
    r_angle_pole4 = 1.5707963267949
    p_angle_pole4 = 0
    y_angle_pole4 = 0

    lidar_11_fixed = caculate(0, -0.475, -0.2, r_angle_pole1, p_angle_pole1, y_angle_pole1, -0.415985705489921, 1.11290021179622, 0.481)
    lidar_12_fixed = caculate(0, -0.475, 1.2, r_angle_pole1, p_angle_pole1, y_angle_pole1, -0.415985705489921, 1.11290021179622, 0.481)
    lidar_2_fixed = caculate(0, -0.28919, 1.14, r_angle_pole4, p_angle_pole4, y_angle_pole4, 0.000974248361056473, 0.150707650139425, 0.480970397293368)

    print("lidar11:")
    print(lidar_11_fixed)
    print("lidar12:")
    print(lidar_12_fixed)
    print("lidar2:")
    print(lidar_2_fixed)

def caculate(xp, yp, zp, r_angle, p_angle, y_angle, x, y, z):

    Rx = [[1                 ,0                ,0],
        [0,math.cos(r_angle),-math.sin(r_angle)],
        [0,math.sin(r_angle),math.cos(r_angle)]]
    Ry = [[math.cos(p_angle),0,math.sin(p_angle)],
            [0,               1,               0],
            [-math.sin(p_angle),0,math.cos(p_angle)]]
    Rz = [[math.cos(y_angle),-math.sin(y_angle),0],
            [math.sin(y_angle),math.cos(y_angle),0],
            [0                ,0                ,1]]

    R = np.matmul(Rz,np.matmul(Ry,Rx))

    # RTmatrix 
    T = [[x],[y],[z]]
    O1 = np.transpose([[0],[0],[0],[1]])
    RT = np.append(R,T,axis=1)
    transform = np.append(RT,O1,axis=0)
    print(transform)

    # lidar pose in pole1 coordinates
    lidar = [[xp],[yp],[zp],[1]]

    # lidar pose in world coordinates
    lidar_fixed = np.matmul(transform,lidar)

    return lidar_fixed


main()