#!/usr/bin/env python3

"""
Convert filtered radar messages to points of interest (POIs).
"""


import numpy as np

from msgs.msg._MsgRadar import MsgRadar
from msgs.msg._MsgRadarObject import MsgRadarObject

from ..utils.transform import world2pixel


def w2p(obj: MsgRadarObject, camera: str, calib: np.array):
    world_pos = np.array([[obj.pos_x],[obj.pos_y],[0.46],[1]])
    pixel_pos = world2pixel(calib, camera, world_pos)
    return pixel_pos


def radar_poi(radar_msgs: MsgRadar, calib: np.array, width2: int, height2: int, width3: int, height3: int):
    # left
    pl0 = map(lambda x: w2p(x, "camera2", calib), radar_msgs.objects_left)
    pl1 = tuple(filter(lambda pos: 0 <= pos[0][0] <= width2 and 0<= pos[1][0] <= height2, pl0))
    # right
    pr0 = map(lambda x: w2p(x, "camera3", calib), radar_msgs.objects_right)
    pr1 = tuple(filter(lambda pos: 0 <= pos[0][0] <= width3 and 0<= pos[1][0] <= height3, pr0))

    return pl1, pr1
