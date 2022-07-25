#!/usr/bin/env python3

"""
Convert filtered radar messages to points of interest (POIs).
Convert raw images to regions of interest (ROIs).
And many other related functions.
"""


import numpy as np
from PIL import Image

import ros_numpy
from msgs.msg._MsgRadarObject import MsgRadarObject

from .yolo.yolo import YOLO
from .transform import w2p
from .transform import which_cameras, box_to_corner_3d, lidar2pixel
from .common_utils import label2camera


get_area = lambda x: (x[2] - x[0]) * (x[3] - x[1])


def image_roi(image, yolo: YOLO):
    '''
    The output is given in pixel coordinate and in the form of [left, top, right, bottom, score, class].
    '''
    # convert image format
    image = ros_numpy.numpify(image)
    image = Image.fromarray(image)
    # detect image
    return yolo.detect_image(image)


def radar_poi(radar_objs: MsgRadarObject, w2c: np.ndarray, c2p: np.ndarray, image_width: int, image_height: int):
    '''
    The output is the position of objects in world coordinate, camera coordinate,
    the distance from object to camera, and the range rate (velocity) of objects.
    '''
    ps = np.empty(shape=(0, 3), dtype=int)  # (u, v, 1)
    zs = np.empty(shape=(0, 3))             # (distance, angle, velocity)
    for obj in radar_objs:
        pos_image, zc = w2p(np.array([obj.pos_x, obj.pos_y, 0.461, 1]), w2c, c2p)
        if 0 <= pos_image[0] <= image_width and 0 <= pos_image[1] <= image_height:
            ps = np.concatenate((ps, np.expand_dims(pos_image, axis=0))) 
            zs = np.concatenate((zs, [[zc, obj.angle_centroid, obj.velocity]]))
    return ps, zs


def expand_poi(poi: np.ndarray, distance: float, image_width: int, image_height: int):
    '''
    The function is used to generate an approximate ROI based on the radar POI and distance.
    The POI should be given in pixel coordinate.
    '''
    rw, rh = 60 / distance, 30 / distance   # region size (64*2, 32*4) = (128, 128)  TODO: NEED MORE TESTS.
    r0 = np.array((poi[0] - rw, poi[1] - 3 * rh, poi[0] + rw, poi[1] + rh))
    r1 = np.where((r0[0] > 0, r0[1] > 0, r0[2] < image_width, r0[3] < image_height), r0, (0, 0, image_width, image_height))
    return r1


def get_iou(roi1: np.ndarray, roi2: np.ndarray):
    '''
    The function calculates the IOU of two rectangular regions. The ROIs should be given in pixel coordinate.
    It doesn't check whether the ROIs are legal, please check that by yourself if needed.
    '''
    r0 = np.where((roi1[0] > roi2[0], roi1[1] > roi2[1], roi1[2] < roi2[2], roi1[3] < roi2[3]), roi1, roi2)
    if r0[0] >= r0[2] or r0[1] >= r0[3]:
        return 0.0
    ai = get_area(r0)                           # area of intersection
    au = get_area(roi1) + get_area(roi2) - ai   # area of union
    return ai / au


def optimize_iou(rois1: np.ndarray, rois2: np.ndarray, threshold=0.6):
    '''
    The function calculates the IOU matrix of two groups of ROIs, and then match the IOUs.
    It gives the indices of the matched IOUs.\n
    It looks for the max number of each row and set other numbers to 0, then repeats the process of each column.
    So the results are the greatest of each row but maybe not the greatest of each column.\n
    TODO: FIGURE OUT THE PROPER THRESHOLD.
    '''
    if rois1.size == 0 or rois2.size == 0:
        return np.empty(shape=(2, 0), dtype=int)
    # calculate all IOUs and arrange them in a matrix
    ious = np.array([get_iou(x[0:4], y[0:4]) for x in rois1 for y in rois2]).reshape((rois1.shape[0], rois2.shape[0]))
    # only keep the max number by rows and columns
    ious = np.where(np.expand_dims(ious.argmax(axis=1), axis=1) == np.expand_dims(np.arange(ious.shape[1]), axis=0), ious, 0.0)
    ious = np.where(np.expand_dims(ious.argmax(axis=0), axis=0) == np.expand_dims(np.arange(ious.shape[0]), axis=1), ious, 0.0)
    print("IOU matrix:", ious)
    # return indices of maximized IOUs of radar and image
    return np.argwhere(ious > threshold).T


def pointcloud_roi(calib: np.array, boxes_3d: np.array(np.array)):
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

    # For all vehicles: get corresponding cameras and 8-point coords in world coord
    cameras = which_cameras(boxes_3d)
    corners3d = box_to_corner_3d(boxes_3d)

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
