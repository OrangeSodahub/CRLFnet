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
        self.LENGTH = 0.22
        self.WIDTH = 0.21
        self.COLLIDE_THRES = 0.5
        self.SLOW_DOWN_THRES = 1.5
        self.lane_orient = [1, 4, 4, 1, 4, 4, 4, 4, 4, 1, 3, 1, 2, 4, 2, 4, 2, 2, 2,
                            2]  # 1: intersection, 2: circle, 3: overpass, 4: outerring

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

    def is_collide(self, poses, lanes: np.ndarray) -> int:
        """
            return if collide and v coeff.
        """

        def is_lane(sl, l, sp, p):
            yaw = abs(np.arctan2(p[0][1] - sp[0][1], p[0][0] - sp[0][0]) - sp[1] * self.throttle)
            if sl != l:
                if sl == 10 or l == 10:
                    return False
                elif abs(sp[1]) - abs(p[1]) > np.pi / 3:
                    return True
                return False
            else:
                if yaw <= np.pi / 4:
                    return True
                return False

        for i, p in enumerate(poses):
            if i == self.index:
                continue
            sp = poses[self.index]
            if is_lane(self.tmp_lane, lanes[i], sp, p):
                dist = np.linalg.norm(sp[0] - p[0])
                if dist <= self.COLLIDE_THRES:
                    return False
                elif dist < self.SLOW_DOWN_THRES:
                    return (dist - self.COLLIDE_THRES) / (self.SLOW_DOWN_THRES - self.COLLIDE_THRES)
        return True

    def target2control(self, poses, lanes: np.ndarray) -> Tuple[float, float]:
        v_control = self.is_collide(poses, lanes)
        if not v_control:
            return 0, 0
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        yaw = (yaw + np.pi) % (2 * np.pi) - np.pi
        distance = np.linalg.norm(self.tmp_target - self.pos)  # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1)
        rotation = np.arcsin(sin_rot)
        # old method
        steer = np.clip(rotation / self.MAX_STEER, -1, 1)
        throttle = (1 if abs(yaw) < np.pi / 2 else -1) * v_control
        # new method
        '''
        steer = rotation / self.MAX_STEER
        if steer < -1 or steer > 1:
            # target is not accessable
            steer = 1 if steer < -1 else -1
            throttle = -1 * v_control
        elif yaw > np.pi / 2 or yaw < -np.pi / 2:
            # target is behind the vehicle
            steer = 1 if yaw > np.pi / 2 else -1
            throttle = 1 * v_control
        else:
            # common situation
            throttle = 1 * v_control
        '''
        self.throttle = throttle
        return steer, throttle

    def choose_way(self, node: int, from_lane: int, poses, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam, nums_area) -> int:
        """Choose an accessable lane randomly."""
        lanes = self.scene_map.accessable_lanes(node, from_lane)
        if len(lanes) == 0:
            return -1
        lane = np.random.choice(lanes)
        # lane = self.score_lanes(poses, lanes, msg_rad_cam, msg_lid_cam, nums_area)
        return lane

    def score_lanes(self, poses, lanes: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam, nums_area):
        """
            caculate weighted score of accessible lanes
        """

        def set_weight(orient, nums_area):
            nums_index = np.argsort(nums_area) + 1
            return (np.where(nums_index == orient)[0][0] + 1)

        lane_num = [0] * len(lanes)
        for i, lane in enumerate(lanes):
            # dists = np.array([[np.linalg.norm(np.array([v.pos_x, v.pos_y]), pt) for pt in self.scene_map.lanes[lane]] for v in (msg_lid_cam.objects_circle+msg_lid_cam.objects_intersection)])
            dists = np.array([[np.linalg.norm(p[0] - pt) for pt in self.scene_map.lanes[lane]] for p in poses])
            dists_convert = dists <= 0.05
            lane_num[i] += np.sum(dists_convert)
        lane_orient = [self.lane_orient[lane] for lane in lanes]
        # nums_area = [msg_lid_cam.num_intersection, msg_lid_cam.objects_circle, msg_rad_cam.num_overpass]
        lane_weight = [set_weight(orient, nums_area) for orient in lane_orient]
        lane_score = [a * b for a, b in zip(lane_num, lane_weight)]
        return lanes[np.where(lane_score == np.min(lane_score))[0][0]]

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

    def lane_nav(self, poses, msg_rad_cam, msg_lid_cam, nums_area) -> None:
        # if the vehicle hasn't reached the target, do not change the target
        if self.distance > self.TARGET_THRES:
            return
        # if the vehicle has reached the target
        lane = self.scene_map.lanes[self.tmp_lane]
        # if the vehicle is at the end of the lane, change to intersect mode
        if self.tmp_lane_point >= len(lane):
            node = self.scene_map.accessable_node(self.tmp_lane)
            self.tmp_lane = self.choose_way(node, self.tmp_lane, poses, msg_rad_cam, msg_lid_cam, nums_area)
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

    def navigate(self, poses, lanes: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam, nums_area) -> None:
        # update the position and orientation data
        self.update(poses[self.index][0], poses[self.index][1])
        # if the vehicle is too far away from the target, change to lost mode
        if self.mode == 'lost':
            self.lost_nav()
        elif self.distance > self.TARGET_RANGE:
            self.mode = 'lost'
            self.lost_nav()
        elif self.mode == 'lane':
            self.lane_nav(poses, msg_rad_cam, msg_lid_cam, nums_area)
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
        nums_area = self.calc_num(poses, lanes)
        steers, throttles = [], []
        for v in self.vehicles:
            steer, throttle = v.navigate(poses, lanes, msg_rad_cam, msg_lid_cam, nums_area)
            steers.append(steer)
            throttles.append(throttle)
        return steers, throttles, nums_area

    def calc_num(self, poses, lanes: np.ndarray):
        """
            For temporarily using vehicles num
        """
        intersection, circle, overpass, outerring = 0, 0, 0, 0
        for i, p in enumerate(poses):
            if lanes[i] == 10:
                overpass += 1
            elif (p[0][1] >= 0 and p[0][1] <= 1.7 and p[0][0] <= 1 and p[0][0] >= -1.2):
                intersection += 1
            elif (p[0][1] < 0 and p[0][1] >= -2.2 and p[0][0] <= 1 and p[0][0] >= -1.2):
                circle += 1
            else:
                outerring += 1
        nums_area = [intersection, circle, overpass, outerring]

        return nums_area