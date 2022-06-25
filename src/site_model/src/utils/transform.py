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

def which_cameras(pred_boxes: np.array(np.array)):
    """
        The location of cameras:
        +-------------------------------+
        |\         /|\                 /| 
        | \  (1)  / |  \     (3)     /  |
        |  \     /  |    \         /    |
        |   \   /   |      \     /      |
        | (5)\ /(6) |  (5)   \ /   (6)  |
        intersection|       circle      |
        |    / \    |        / \        |
        |   /   \   |      /     \      |
        |  /     \  |    /         \    |
        | /  (2)  \ |  /     (4)     \  |
        |/         \|/                 \|
        +-------------------------------+
    """
    # defined information
    slope_intersection = 2.92 / 1.92
    slope_circle = 4.92 / 1.92
    intersection = [-1.92, 2.92, 1.92, 0, 0, 0.7] # [x1,y1, x2,yx, cx,cy]
    circle = [-1.92, 0, 1.92, -4.92, 0, -0.95] # [x1,y1, x2,yx, cx,cy]

    cameras = []

    # deal with sinle vehicle
    def process_single_vehicle(loc, dim, ry):
        """
            loc: [x, y, z]
            dim: [x, y, z]
            ry: int
        """
        camera = []
        # 1
        if loc[0] > 0 and loc[1] > 0:
            if loc[1] <= loc[0]*slope_intersection+intersection[5] and loc[1] >= loc[0]*(-slope_intersection)+intersection[5]:
                camera.append(2) # camera12
            # 5
            elif loc[1] > loc[0]*slope_intersection:
                camera.append(3) # camera13
                camera.append(7) # camera43
            # 6
            elif loc[1] < loc[0]*(-slope_intersection):
                camera.append(1) # camera11
                camera.append(5) # camera41
        # 3
        elif loc[0] > 0 and loc[1] < 0:
            if loc[1] <= loc[0]*slope_circle+circle[5] and loc[1] >= loc[0]*(-slope_circle)+circle[5]:
                camera.append(6) # camera42
            elif loc[1] > loc[0]*slope_circle+circle[5]:
                camera.append(3) # camera13
                camera.append(7) # camera43
            elif loc[1] < loc[0]*(-slope_circle)+circle[5]:
                camera.append(1) # camera11
                camera.append(5) # camera41
        # 2
        elif loc[0] < 0 and loc[1] > 0:
            if loc[1] <= loc[0]*(-slope_intersection)+intersection[5] and loc[1] >= loc[0]*slope_intersection+intersection[5]:
                camera.append(4) # camera14
            # 5
            elif loc[1] > loc[0]*(-slope_intersection):
                camera.append(3) # camera13
                camera.append(7) # camera43
            # 6
            elif loc[1] < loc[0]*slope_intersection:
                camera.append(1) # camera11
                camera.append(5) # camera41
        # 4
        elif loc[0] < 0 and loc[1] < 0:
            if loc[1] <= loc[0]*(-slope_circle)+circle[5] and loc[1] >= loc[0]*slope_circle+circle[5]:
                camera.append(8) # camera44
            # 5
            elif loc[1] > loc[0]*(-slope_circle)+circle[5]:
                camera.append(3) # camera13
                camera.append(7) # camera43
            # 6
            elif loc[1] < loc[0]*slope_circle+circle[5]:
                camera.append(1) # camera11
                camera.append(5) # camera41
        
        return camera

    for pred_box in pred_boxes:
        camera = process_single_vehicle(pred_box[0:3], pred_box[3:6], pred_box[6])
        cameras.append(camera)
    
    return cameras