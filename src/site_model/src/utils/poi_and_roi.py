#!/usr/bin/env python3
"""
Convert filtered radar messages to points of interest (POIs).
Convert raw images to regions of interest (ROIs).
And many other related functions.
"""

from PIL import Image
from typing import Tuple
import numpy as np
from scipy.optimize import linear_sum_assignment

import ros_numpy

from .yolo.yolo import YOLO
from .transform import w2p, which_cameras, box_to_corner_3d, lidar2pixel
from .common_utils import label2camera


def get_area(box: np.ndarray) -> int:
    return (box[2] - box[0]) * (box[3] - box[1])


def image_roi(image, yolo: YOLO) -> np.ndarray:
    '''
    The output is given in pixel coordinate and in the form of [left, top, right, bottom, score, class].
    '''
    if not isinstance(image, Image.Image):
        # convert image format
        image = ros_numpy.numpify(image)
        image = Image.fromarray(image)
    # detect image
    return yolo.detect_image(image)


def radar_poi(obj_poses: np.ndarray, w2c: np.ndarray, c2p: np.ndarray, height: float) -> np.ndarray:
    '''
    The function takes in the positions of objects in the world coordinate and calib matirces,
    and outputs the point of interest in the pixel coordinate.
    '''
    ps = [w2p(np.concatenate([pos[0:2], [height, 1.]]), w2c, c2p)[0] for pos in obj_poses]
    return np.array(ps, dtype=int)


def expand_poi(poi: np.ndarray, distance: float, image_width: int, image_height: int) -> np.ndarray:
    '''
    The function is used to generate an approximate ROI based on the radar POI and distance.
    The POI should be given in pixel coordinate.
    '''
    rw, rh = 60 / distance, 30 / distance  # region size (64*2, 32*4) = (128, 128)  TODO: NEED MORE TESTS.
    r0 = np.array((poi[0] - rw, poi[1] - 3 * rh, poi[0] + rw, poi[1] + rh))
    r1 = np.where((r0[0] > 0, r0[1] > 0, r0[2] < image_width, r0[3] < image_height), r0, (0, 0, image_width, image_height))
    return r1


def get_iou(roi1: np.ndarray, roi2: np.ndarray) -> float:
    '''
    The function calculates the IOU of two rectangular regions. The ROIs should be given in pixel coordinate.
    It doesn't check whether the ROIs are legal, please check that by yourself if needed.
    '''
    r0 = np.where((roi1[0] > roi2[0], roi1[1] > roi2[1], roi1[2] < roi2[2], roi1[3] < roi2[3]), roi1, roi2)
    if r0[0] >= r0[2] or r0[1] >= r0[3]:
        return 0.0
    ai = get_area(r0)  # area of intersection
    au = get_area(roi1) + get_area(roi2) - ai  # area of union
    return ai / au


def optimize_iou(rois1: np.ndarray, rois2: np.ndarray, threshold: float) -> Tuple[np.ndarray, np.ndarray]:
    '''
    The function calculates the IOU matrix of two groups of ROIs, and then match the IOUs.
    It gives the indices of the matched IOUs.\n
    '''
    if rois1.size == 0 or rois2.size == 0:
        return np.empty(0, dtype=int), np.empty(0, dtype=int)
    ious = np.array([get_iou(x[0:4], y[0:4]) for x in rois1 for y in rois2]).reshape((len(rois1), len(rois2)))
    idx1, idx2 = linear_sum_assignment(ious, maximize=True)
    thres_filter = ious[idx1, idx2] >= threshold
    idx1 = np.extract(thres_filter, idx1)
    idx2 = np.extract(thres_filter, idx2)
    return idx1, idx2


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
        pixel_pose.append([])  # add new vehicle
        vehicle_num += 1
        for camera_label in camera:
            camera_name = label2camera[camera_label]
            pixel_pose_single_img = lidar2pixel(calib, camera_name, world_pose)
            pixel_pose[vehicle_num].append(pixel_pose_single_img)

    return cameras, corners3d, pixel_pose
