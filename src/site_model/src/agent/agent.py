# !/usr/bin/python3

import numpy as np
from typing import Tuple

from msgs.msg._MsgRadCam import MsgRadCam  # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam  # lidar camera fusion message type
from msgs.msg._MsgLidCamObject import MsgLidCamObject

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
        self.LENGTH = 0.22
        self.WIDTH = 0.21
        self.COLLIDE_THRES = 0.5
        self.lane_orient = [0,0,0,1,2,3,0,0,...]  # 1: intersection, 2: circle, 3: overpass

        self.mode = 'lost'
        self.pos = np.array([0, 0])
        self.orient = 0
        self.distance = 0
        self.tmp_target = np.array([0, 0])
        self.tmp_lane = -1
        self.tmp_lane_point = -1
        self.throttle = 1

    def update(self, pos: np.ndarray, orient: float) -> None:
        self.pos = pos
        self.orient = orient
        self.distance = np.linalg.norm(self.tmp_target - self.pos)

    def is_collide(self, poses, lanes: np.ndarray) -> bool:
        def is_lane(sl, l, sp, p):
            if sl != l:
                if sl == 18 or l == 18:
                    return False
                else:
                    if abs(sp[1]) - abs(p[1]) > np.pi / 3:
                        return True
                    return False
            return True

        for i, p in enumerate(poses):
            if i == self.index:
                continue
            sp = poses[self.index]
            if ((np.arctan2(p[0][1]-sp[0][1], p[0][0]-sp[0][0]) - sp[1]*self.throttle) < np.pi / 12 and
                np.linalg.norm(sp[0] - p[0]) <= self.COLLIDE_THRES and is_lane(self.tmp_lane, lanes[i], sp, p)):
                return True
        return False

    def target2control(self, poses, lanes: np.ndarray) -> Tuple[float, float]:
        if self.is_collide(poses, lanes):
            return 0, 0
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        distance = np.linalg.norm(self.tmp_target - self.pos)  # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1)
        rotation = np.arcsin(sin_rot)
        steer = np.clip(rotation / self.MAX_STEER, -1, 1)
        throttle = 1 if abs(yaw) < np.pi / 2 else -1
        self.throttle = throttle
        return steer, throttle

    def choose_way(self, node: int, pos: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> int:
        """Choose an accessable lane randomly."""
        lanes = self.scene_map.accessable_lanes(node)
        if len(lanes) == 0:
            return -1
        lane = np.random.choice(lanes)
        # lane = calc_density(lanes, msg_rad_cam, msg_lid_cam)
        return lane

    def calc_density(self, pos: np.ndarray, lanes: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam):
        """
            caculate weighted score of accessible lanes
        """
        def set_weight(orient, nums_area):
            min_area, max_area = np.argmin(nums_area), np.argmax(nums_area)
            if orient == min_area:
                return 1
            elif orient == max_area:
                return 3
            return 2
        lane_num = [0]*len(lanes)
        for i, lane in enumerate(lanes):
            dists = np.array([[np.linalg.norm(np.array([v.pos_x, v.pos_y]), p) for p in self.scene_map.lanes[lane]] for v in (msg_lid_cam.objects_circle+msg_lid_cam.objects_intersection)])
            dists_convert = dists <= 0.05
            lane_num[i] += np.sum(dists_convert)
        lane_orient = [self.lane_orient[lane] for lane in lanes]
        nums_area = [msg_lid_cam.num_intersection, msg_lid_cam.objects_circle, msg_rad_cam.num_overpass]
        lane_weight = [set_weight(orient, nums_area) for orient in lane_orient]
        lane_score = np.average(lane_num, weights=lane_weight)
        return lanes[np.where(lane_score==np.min(lane_score))[0][0]]

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

    def navigate(self, poses, lanes: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> None:
        # update the position and orientation data
        self.update(poses[self.index][0], poses[self.index][1])
        # if the vehicle is too far away from the target, change to lost mode
        if self.mode == 'lost':
            self.lost_nav()
        elif self.distance > self.TARGET_RANGE:
            self.mode = 'lost'
            self.lost_nav()
        elif self.mode == 'lane':
            self.lane_nav(poses[self.index], msg_rad_cam, msg_lid_cam)
        elif self.mode == 'intersection':
            self.intersect_nav()
        # if an error occurs, the vehicle stops
        elif self.mode == 'await':
            print("AWAIT MODE #{}".format(self.index), end='\r')
            return 0, 0
        print("Vehicle:{}, Mode: {}, Target: {}".format(self.index, self.mode, self.tmp_target), end='\r')
        return self.target2control(poses, lanes)


class Agents:

    def __init__(self, scene_map: SceneMap, num: int) -> None:
        self.num = num
        self.vehicles = [Agent(scene_map, i) for i in range(num)]

    def navigate(self, poses, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> Tuple[int, int]:
        lanes = [v.tmp_lane for v in self.vehicles]
        steers, throttles = [], []
        for v in self.vehicles:
            steer, throttle = v.navigate(poses, lanes, msg_rad_cam, msg_lid_cam)
            steers.append(steer)
            throttles.append(throttle)
        return steers, throttles
