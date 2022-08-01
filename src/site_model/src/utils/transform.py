#!/usr/bin/env python3

#############################################################
#                                                           #
#               Transorm the coordinates.                   #
#                                                           #
#############################################################


import numpy as np
import torch
from .common_utils import check_numpy_to_torch, label2camera, transform


def w2p(pos: np.ndarray, w2c: np.ndarray, c2p: np.ndarray):
    '''
    Input the position of a point in the world coordinate, the w2c and c2p matrices.
    Output the position of the point in the pixel coordinate and the distance between the point and the camera.
    '''
    pos = np.concatenate([pos[0:3], [1]], axis=0)
    pos_cam = np.matmul(w2c, pos)
    pos_pix = np.matmul(c2p, pos_cam) / pos_cam[2]
    return pos_pix.astype(int), pos_cam[2]


def p2w(pos: np.ndarray, zw: float, w2c: np.ndarray, c2p: np.ndarray):
    '''
    Input the position of a point in the pixel coordinate, the height of the radar, the w2c and c2p matrices.
    Output the position of the point in the world coordinate and the distance between the point and the camera.
    '''
    pos = np.concatenate([pos[0:2], [1]], axis=0)
    m1 = c2p[:,0:3]
    m1i = np.linalg.inv(m1)
    m2i = np.linalg.inv(w2c)
    pos_cam_like = np.matmul(m1i, pos)
    zc = (zw - m2i[2, 3]) / np.dot(m2i[2, 0:3], pos_cam_like)
    pos_wld = np.matmul(m2i, np.concatenate([zc * pos_cam_like, [1]]))
    return pos_wld, zc


def world2pixel(calib: np.array, camera_name: str, world_pose: np.array):
    """
        world_pose -> camera_pose : external parameter of camera
        camera_pose -> pixel_pose : internal parameter of camera
        tips: shift is need between external and internal parameter
    """
    # transform from camera name to camera number
    camera_num = transform[camera_name]

    # get external and internal parameter of camera
    world_to_camera = calib[camera_num][1:17].reshape(4,4)
    camera_to_pixel = calib[camera_num][17:30].reshape(3,4)

    # coordinates in camera coordinates
    camera_pose = np.matmul(world_to_camera, world_pose)
    distance = camera_pose[0]
    
    # shift the coordinates
    camera_pose_shift = [camera_pose[1],
                        camera_pose[2],
                       -camera_pose[0],
                       -distance] / (-distance)

    # coordinates in pixel coordinates
    pixel_pose = np.matmul(camera_to_pixel, camera_pose_shift)

    return pixel_pose


# eight points
def lidar2pixel(calib: np.array, camera_name: str, world_pose: np.array):
    """
        wold_pose: [[],[],[],[],[],[],[],[]] []->[x,y,z]
        pixel_pose: [[],[],[],[],[],[],[],[]] []->[left, top, right, down]
    """
    pixel_pose = []
    for i in range(len(world_pose)):
        world_pose_point = np.append(world_pose[i], 1) # expand size from 3 to 4
        pixel_pose.append(world2pixel(calib, camera_name, world_pose_point))
    return pixel_pose


# For each time -> all vehicles
def which_cameras(pred_boxes: np.array(np.array)):
    """
        Function to sectorize the lidarData to represent sectors where an object is detected
        The location of cameras:
        +-------------------------------+
        |\         /|\                 /| 
        | \  (1)  / |  \     (3)     /  |
        |  \     /  |    \         /    |
        |   \   /   |      \     /      |
        | (5)\ /(5,6) (5,6)  \ /   (6)  |
        intersection|       circle      |
        |    / \    |        / \        |
        |   /   \   |      /     \      |
        |  /     \  |    /         \    |
        | /  (2)  \ |  /     (4)     \  |
        |/         \|/                 \|
        +-------------------------------+
    """
    # defined information
    intersection = [-1.92, 2.92, 1.92, 0, 0, 0.7] # [x1,y1, x2,y2, cx,cy]
    circle = [-1.92, 0, 1.92, -2.5, 0, -0.95] # [x1,y1, x2,y2, cx,cy]
    slope_intersection = np.abs(intersection[1]) / np.abs(intersection[0])
    slope_circle = np.abs(circle[3]) / np.abs(circle[2])

    cameras = []

    # deal with sinle vehicle
    def process_single_vehicle(loc):
        """
            loc: [x, y, z]
            dim: [dx, dy, dz]
            ry: int
        """
        camera = []
        # 1
        if loc[0] >= 0 and loc[1] >= 0:
            if loc[1] <= loc[0]*slope_intersection+intersection[5] and loc[1] >= loc[0]*(-slope_intersection)+intersection[5]:
                camera.append(4) # camera14
                camera.append(7) # camera43
            # 5
            elif loc[1] >= loc[0]*slope_intersection+intersection[5]:
                camera.append(1) # camera11
                camera.append(7) # camera43
            # 6
            elif loc[1] <= loc[0]*(-slope_intersection)+intersection[5]:
                camera.append(3) # camera13
                camera.append(7) # camera43
        # 3
        elif loc[0] >= 0 and loc[1] <= 0:
            if loc[1] <= loc[0]*slope_circle+circle[5] and loc[1] >= loc[0]*(-slope_circle)+circle[5]:
                camera.append(6) # camera42
                camera.append(3) # camera13
            elif loc[1] >= loc[0]*slope_circle+circle[5]:
                camera.append(7) # camera43
                camera.append(3) # camera13
            elif loc[1] <= loc[0]*(-slope_circle)+circle[5]:
                camera.append(5) # camera41
                camera.append(3) # camera13
        # 2
        elif loc[0] <= 0 and loc[1] >= 0:
            if loc[1] <= loc[0]*(-slope_intersection)+intersection[5] and loc[1] >= loc[0]*slope_intersection+intersection[5]:
                camera.append(2) # camera12
                camera.append(7) # camera43
            # 5
            elif loc[1] >= loc[0]*(-slope_intersection)+intersection[5]:
                camera.append(1) # camera11
                camera.append(7) # camera43
            # 6
            elif loc[1] <= loc[0]*slope_intersection+intersection[5]:
                camera.append(3) # camera13
                camera.append(7) # camera43
        # 4
        elif loc[0] <= 0 and loc[1] <= 0:
            if loc[1] <= loc[0]*(-slope_circle)+circle[5] and loc[1] >= loc[0]*slope_circle+circle[5]:
                camera.append(8) # camera44
                camera.append(3) # camera13
            # 5
            elif loc[1] >= loc[0]*(-slope_circle)+circle[5]:
                camera.append(7) # camera43
                camera.append(3) # camera13
            # 6
            elif loc[1] <= loc[0]*slope_circle+circle[5]:
                camera.append(5) # camera41
                camera.append(3) # camera13
        
        return camera

    for pred_box in pred_boxes:
        camera = process_single_vehicle(pred_box[0:3])
        cameras.append(camera)
    return cameras


# caculate the 8 points coordinates of pred_boxes: all vehicles
def box_to_corner_3d(boxes3d):
    """
    The label of each corner: 
           4--------------3
          /|             /|
         / |            / |
        1--------------2  |
        |  |           |  |
        |  8-----------|--7
        | /            | /
        |/             |/
        5--------------6
    """

    boxes3d, is_numpy = check_numpy_to_torch(boxes3d)
    template = boxes3d.new_tensor((
        [1, 1, -1], [1, -1, -1], [-1, -1, -1], [-1, 1, -1],
        [1, 1, 1], [1, -1, 1], [-1, -1, 1], [-1, 1, 1],
    )) / 2

    corners3d = boxes3d[:, None, 3:6].repeat(1, 8, 1) * template[None, :, :]
    corners3d = rotate_points_along_z(corners3d.view(-1, 8, 3), boxes3d[:, 6]).view(-1, 8, 3)
    corners3d += boxes3d[:, None, 0:3]

    return corners3d.numpy() if is_numpy else corners3d


def rotate_points_along_z(points, angle):
    """
    Args:
        points: (B, N, 3 + C)
        angle: (B), angle along z-axis, angle increases x ==> y
    Returns:

    """
    points, is_numpy = check_numpy_to_torch(points)
    angle, _ = check_numpy_to_torch(angle)

    cosa = torch.cos(angle)
    sina = torch.sin(angle)
    zeros = angle.new_zeros(points.shape[0])
    ones = angle.new_ones(points.shape[0])
    rot_matrix = torch.stack((
        cosa,  sina, zeros,
        -sina, cosa, zeros,
        zeros, zeros, ones
    ), dim=1).view(-1, 3, 3).float()
    points_rot = torch.matmul(points[:, :, 0:3], rot_matrix)
    points_rot = torch.cat((points_rot, points[:, :, 3:]), dim=-1)

    return points_rot.numpy() if is_numpy else points_rot


def get_dpm(calib: np.array, camera_num: int, ground_pose: np.array, type: int):
    """
        Dots per m
    """

    camera_name = label2camera[camera_num]
    if not type:
        world_pose_1, world_pose_2 = np.array([ground_pose[0], ground_pose[1]-0.2, 0.2, 1]), np.array([ground_pose[0], ground_pose[1]+0.2, 0.2, 1])
    elif type:
        world_pose_1, world_pose_2 = np.array([ground_pose[0]-0.2, ground_pose[1], 0.2, 1]), np.array([ground_pose[0]+0.2, ground_pose[1], 0.2, 1])

    pixel_pose_1, pixel_pose_2 = world2pixel(calib, camera_name, world_pose_1), world2pixel(calib, camera_name, world_pose_2)
    dpm = 0.4 / abs(pixel_pose_2[0]-pixel_pose_1[0])

    return dpm
