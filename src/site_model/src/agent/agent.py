# !/usr/bin/env python3

from typing import List, Tuple
import numpy as np

from .scene import DynamicMap

MODES = ['lane', 'node', 'lost', 'error']


class Agent:

    def __init__(self, scene_map: DynamicMap, index: int) -> None:
        # vehicle data
        self.index = index                     # the index of the vehicle
        self.scene_map = scene_map             # the map of the scene
        self.LEN = 0.163974                    # the length between the front wheel and the rear wheel
        self.MAX_STEER = np.pi / 4             # the max turning angle (rad) of the front wheels
        self.LENGTH = 0.22                     # the length of the vehicle
        self.WIDTH = 0.21                      # the width of the vehicle

        # thresholds
        self.TARGET_RANGE = 1.0                # if d(target, self) > TARGET_RANGE, switch to lost mode
        self.TARGET_THRES = 0.25               # if d(target, self) < TARGET_THRES, the vehicle has reached the target
        self.COLLIDE_THRES = 0.5               # if d(another_vehicle, self) < COLLIDE_THRES, the vehicle stops
        self.SLOW_DOWN_THRES = 1.0             # if d(another_vehicle, self) < SLOW_DOWN_THRES, the vehicle slows down

        # running data
        self.mode = 'lost'
        self.pos = np.array([0, 0])            # position (X, Y) (m) | np.ndarray(shape=(2), dtype=float)
        self.orient = 0                        # orientation (rad)
        self.distance = 0                      # d(target, self) (m)
        self.throttle = 1                      # throttle
        self.tmp_target = np.array([0, 0])     # target (X, Y) (m) | np.ndarray(shape=(2), dtype=float)
        self.tmp_lane = -1                     # index of lane (-1 represents None)
        self.tmp_lane_point = -1               # index of lane point (-1 represents None)
        self.tmp_node = -1                     # index of node (-1 represents None)
        self.stop_flag = False

    def update(self, pos: np.ndarray, orient: float) -> None:
        self.pos = pos
        self.orient = orient
        self.distance = np.linalg.norm(self.tmp_target - self.pos)

    def no_crash(self, all_poses: List[Tuple[np.ndarray, float]]) -> int:
        v = 1.0
        for i, p in enumerate(all_poses):
            # the index of the vehicles start from 1, while i starts from 0
            if i + 1 == self.index:
                continue
            # calculate the distance and angle
            vec = p[0][0:2] - self.pos
            dst = np.linalg.norm(vec)
            ang = np.arctan2(vec[1], vec[0]) - self.orient * np.sign(self.throttle)
            # -pi <= ang <= pi
            ang = (ang + np.pi) % (2 * np.pi) - np.pi
            # the vehicle only slows down or stops when there is an obstacle in front of it
            if -np.pi / 4 <= ang <= np.pi / 4:
                if dst <= self.COLLIDE_THRES:
                    v = 0
                    break
                elif dst <= self.SLOW_DOWN_THRES:
                    v = 0.5
        return v

    def target2control(self, all_poses: List[Tuple[np.ndarray, float]]) -> Tuple[float, float]:
        # prevent crash
        v = self.no_crash(all_poses)
        if v == 0:
            return 0, 0
        # calculate yaw angle and velocity
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        yaw = (yaw + np.pi) % (2 * np.pi) - np.pi              # -pi <= yaw <= pi
        distance = np.linalg.norm(self.tmp_target - self.pos)  # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1)
        rotation = np.arcsin(sin_rot)
        steer = np.clip(rotation / self.MAX_STEER, -1, 1)
        throttle = (1 if abs(yaw) < np.pi / 2 else -1) * v
        self.throttle = throttle
        return steer, throttle

    def choose_way(self, node: int, from_lane: int, num_lane: np.ndarray, num_area: np.ndarray, rand_mode: bool = True) -> int:
        # get accessible
        accessible_lanes = self.scene_map.accessible_lanes(node, from_lane)
        if len(accessible_lanes) == 0:
            return -1
        if rand_mode:
            lane = np.random.choice(accessible_lanes)
        else:
            lane = self.scene_map.score_lanes(accessible_lanes, num_lane, num_area)
        return lane

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

    def lane_nav(self, num_lane: np.ndarray, num_area: np.ndarray) -> None:
        # if the vehicle hasn't reached the target, do not change the target
        if self.distance > self.TARGET_THRES:
            return
        # if the vehicle has reached the target
        lane_points = self.scene_map.lanes[self.tmp_lane]
        # if the vehicle is not at the end, find the next target
        if self.tmp_lane_point < len(lane_points):
            self.tmp_target = lane_points[self.tmp_lane_point]
            self.tmp_lane_point += 1
            return
        # if the vehicle is at the end of the lane, switch to intersect mode
        node = self.scene_map.accessible_node(self.tmp_lane)
        self.tmp_lane = self.choose_way(node, self.tmp_lane, num_lane, num_area)
        if self.tmp_lane == -1:
            self.mode = 'error'
            print("\033[0;31mError: The vehicle #{} is in a dead end.\033[0m".format(self.index))
        else:
            self.tmp_node = node
            self.tmp_lane_point = 0
            self.tmp_target = self.scene_map.lanes[self.tmp_lane][0]
            self.scene_map.reach_intersect(self, node)
            self.mode = 'node'

    def node_nav(self) -> None:
        # if the vehicle has reached the target, change to lane mode
        if self.distance < self.TARGET_THRES:
            self.tmp_lane_point = 1
            self.scene_map.leave_intersect(self, self.tmp_node)
            self.mode = 'lane'

    def navigate(self, pos: Tuple[np.ndarray, float], num_lane: np.ndarray, num_area: np.ndarray,
                 all_poses: List[Tuple[np.ndarray, float]]) -> Tuple[float, float]:
        # update the position and orientation data
        self.update(pos[0][0:2], pos[1])
        # if the stop flag is on, force the vehicle to stop
        if self.stop_flag:
            return 0, 0
        # if the vehicle is too far from the target, switch to lost mode
        if self.distance > self.TARGET_RANGE:
            if self.mode == 'node':
                self.scene_map.leave_intersect(self, self.tmp_node)
            self.mode = 'lost'
        # different modes
        if self.mode == 'lost':
            self.lost_nav()
        elif self.mode == 'lane':
            self.lane_nav(num_lane, num_area)
        elif self.mode == 'node':
            self.node_nav()
        elif self.mode == 'error':
            print("\033[0;31mERROR #{}\033[0m".format(self.index), end='\n')
            return 0, 0
        return self.target2control(all_poses)

    def __repr__(self) -> str:
        return "Index: {},\tMode: {},\tFlag: {},\tTarget: {}".format(self.index, self.mode, self.stop_flag, self.tmp_target)
