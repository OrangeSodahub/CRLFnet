# !/usr/bin/python3

import numpy as np
from typing import Tuple

from msgs.msg._MsgRadCam import MsgRadCam  # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam  # lidar camera fusion message type

from .scene import SceneMap

MODES = ['lane', 'intersection', 'lost', 'await']


class Agent:

    def __init__(self, scene_map: SceneMap, index: int) -> None:
        self.index = index
        self.scene_map = scene_map
        self.LEN = 0.163974  # the length between the front wheel and the rear wheel
        self.MAX_STEER = np.pi / 4
        self.TARGET_RANGE = 1.0
        self.TARGET_THRES = 0.25

        self.mode = 'lost'
        self.pos = np.array([0, 0])
        self.orient = 0
        self.distance = 0
        self.tmp_target = np.array([0, 0])
        self.tmp_lane = -1
        self.tmp_lane_point = -1

    def update(self, pos: np.ndarray, orient: float) -> None:
        self.pos = pos
        self.orient = orient
        self.distance = np.linalg.norm(self.tmp_target - self.pos)

    def target2control(self) -> Tuple[float, float]:
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        distance = np.linalg.norm(self.tmp_target - self.pos)  # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1)
        rotation = np.arcsin(sin_rot)
        steer = np.clip(rotation / self.MAX_STEER, -1, 1)
        throttle = 1 if abs(yaw) < np.pi / 2 else -1
        return steer, throttle

    def choose_way(self, node: int, pos: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> int:
        """Choose an accessable lane randomly."""
        # TODO: code
        lanes = self.scene_map.accessable_lanes(node)
        if len(lanes) == 0:
            return -1
        lane = np.random.choice(lanes)
        return lane

    def calc_density(self, pos: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam):
        # TODO: code
        pass

    def lost_nav(self) -> None:
        # find the nearest node
        if self.distance < self.TARGET_THRES:
            self.tmp_lane_point += 1
            self.mode = 'lane'
            return
        lane, lane_point = self.scene_map.nearest_point(self.pos)
        self.tmp_lane = lane
        self.tmp_lane_point = lane_point
        self.tmp_target = self.scene_map.lanes[lane][lane_point]

    def lane_nav(self, pos: np.ndarray, msg_rad_cam, msg_lid_cam) -> None:
        # if the vehicle hasn't reached the target, do not change the target
        if self.distance > self.TARGET_THRES:
            return
        # if the vehicle has reached the target
        lane = self.scene_map.lanes[self.tmp_lane]
        # if the vehicle is at the end of the lane, change to intersect mode
        if self.tmp_lane_point >= len(lane):
            node = self.scene_map.accessable_node(self.tmp_lane)
            self.tmp_lane = self.choose_way(node, pos, msg_rad_cam, msg_lid_cam)
            if self.tmp_lane == -1:
                self.mode = 'await'
                print("\033[0;31mError: The vehicle #{} is in a dead end.\033[0m".format(self.index))
            else:
                self.tmp_lane_point = 0
                self.tmp_target = self.scene_map.lanes[self.tmp_lane][0]
                self.mode = 'intersection'
                print("\033[0;32mThe vehicle #{} is in intersection #{}.\033[0m".format(self.index, node))
        else:
            # change a new target
            self.tmp_target = lane[self.tmp_lane_point]
            self.tmp_lane_point += 1

    def intersect_nav(self) -> None:
        # if the vehicle has reached the target, change to lane mode
        if self.distance < self.TARGET_THRES:
            self.tmp_lane_point = 1
            self.mode = 'lane'
            return

    def navigate(self, pos: np.ndarray, orient: float, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> None:
        # update the position and orientation data
        self.update(pos, orient)
        # if the vehicle is too far away from the target, change to lost mode
        if self.mode == 'lost':
            self.lost_nav()
        elif self.distance > self.TARGET_RANGE:
            self.mode = 'lost'
            self.lost_nav()
        elif self.mode == 'lane':
            self.lane_nav(pos, msg_rad_cam, msg_lid_cam)
        elif self.mode == 'intersection':
            self.intersect_nav()
        # if an error occurs, the vehicle stops
        elif self.mode == 'await':
            print("AWAIT MODE #{}".format(self.index), end='\r')
            return 0, 0
        print("Vehicle:{}, Mode: {}, Target: {}".format(self.index, self.mode, self.tmp_target), end='\r')
        return self.target2control()


class Agents:

    def __init__(self, scene_map: SceneMap, num: int) -> None:
        self.num = num
        self.vehicles = [Agent(scene_map, i) for i in range(num)]

    def navigate(self, poses, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> Tuple[int, int]:
        steers, throttles = [], []
        for v, p in zip(self.vehicles, poses):
            steer, throttle = v.navigate(p[0], p[1], msg_rad_cam, msg_lid_cam)
            steers.append(steer)
            throttles.append(throttle)
        return steers, throttles
