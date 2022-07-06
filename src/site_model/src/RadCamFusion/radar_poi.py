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
    return pixel_pos.flatten()


def radar_poi(radar_objs: MsgRadarObject, calib: np.array, camera: str, width: int, height: int):
    p0 = map(lambda x: w2p(x, camera, calib), radar_objs)
    p1 = tuple(filter(lambda pos: 0 <= pos[0] <= width and 0<= pos[1] <= height, p0))
    return p1
