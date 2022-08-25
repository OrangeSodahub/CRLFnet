# !/usr/bin/python3

from pathlib import Path
from typing import Tuple, List
import numpy as np

from msgs.msg._MsgRadCam import MsgRadCam  # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam  # lidar camera fusion message type

from .scene import SceneMap

MODES = ['lane', 'intersect', 'lost', 'error']


class Agent:

    def __init__(self, scene_map: SceneMap, index: int) -> None:
        # vehicle data
        self.index = index  # the index of the vehicle
        self.scene_map = scene_map  # the map of the scene
        self.LEN = 0.163974  # the length between the front wheel and the rear wheel
        self.MAX_STEER = np.pi / 4  # the max turning angle (rad) of the front wheels
        self.LENGTH = 0.22  # the length of the vehicle
        self.WIDTH = 0.21  # the width of the vehicle

        # thresholds
        self.TARGET_RANGE = 1.0  # if d(target, self) > TARGET_RANGE, switch to lost mode
        self.TARGET_THRES = 0.25  # if d(target, self) < TARGET_THRES, the vehicle has reached the target
        self.COLLIDE_THRES = 0.5  # if d(another_vehicle, self) < COLLIDE_THRES, the vehicle stops
        self.SLOW_DOWN_THRES = 1.5  # if d(another_vehicle, self) < SLOW_DOWN_THRES, the vehicle slows down

        # running data
        self.mode = 'lost'
        self.pos = np.array([0, 0])  # position (X, Y) (m) | np.ndarray(shape=(2), dtype=float)
        self.orient = 0  # orientation (rad)
        self.distance = 0  # d(target, self) (m)
        self.throttle = 1  # throttle
        self.tmp_target = np.array([0, 0])  # target (X, Y) (m) | np.ndarray(shape=(2), dtype=float)
        self.tmp_lane = -1  # index of lane (-1 represents None)
        self.tmp_lane_point = -1  # index of lane point (-1 represents None)
        self.tmp_node = -1  # index of node (-1 represents None)
        self.stop_flag = False

    def update(self, pos: np.ndarray, orient: float) -> None:
        self.pos = pos
        self.orient = orient
        self.distance = np.linalg.norm(self.tmp_target - self.pos)

    def is_collide(self, poses, lanes: np.ndarray) -> int:
        """Return if collide and v coeff."""

        def is_lane(sl, l, sp, p):
            if self.throttle == -1:
                self_steer = (sp[1] + np.pi) if sp[1] <= 0 else (sp[1] - np.pi)
            else:
                self_steer = sp[1]
            yaw = abs(np.arctan2(p[0][1] - sp[0][1], p[0][0] - sp[0][0]) - self_steer * self.throttle)
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

    def target2control(self, poses, lanes: np.ndarray, intersection_num, priority) -> Tuple[float, float]:
        if self.mode == 'intersection':
            if intersection_num[self.tmp_node] != 0:
                if priority[self.tmp_node][0] != self.index:
                    return 0, 0
        v_control = self.vcontrol(poses, lanes)
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
        """Calculate weighted score of accessible lanes."""

        def set_weight(orient, nums_area):
            nums_index = np.argsort(nums_area) + 1
            return (np.where(nums_index == orient)[0][0] + 1)

        lane_num = [0] * len(lanes)
        for i, lane in enumerate(lanes):
            # dists = np.array([[np.linalg.norm(np.array([v.pos_x, v.pos_y]), pt) for pt in self.scene_map.lanes[lane]] for v in (msg_lid_cam.objects_circle+msg_lid_cam.objects_intersection)])
            dists = np.array([[np.linalg.norm(p[0] - pt) for pt in self.scene_map.lanes[lane]] for p in poses])
            dists_convert = dists <= 0.05
            lane_num[i] += np.sum(dists_convert)
        lane_orient = [self.scene_map.lane_in_area[lane] for lane in lanes]
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
        lane_points = self.scene_map.lanes[self.tmp_lane]
        # if the vehicle is at the end of the lane, change to intersect mode
        if self.tmp_lane_point >= len(lane_points):
            node = self.scene_map.accessable_node(self.tmp_lane)
            self.tmp_lane = self.choose_way(node, self.tmp_lane, poses, msg_rad_cam, msg_lid_cam, nums_area)
            if self.tmp_lane == -1:
                self.mode = 'error'
                print("\033[0;31mError: The vehicle #{} is in a dead end.\033[0m".format(self.index))
            else:
                self.tmp_node = node
                self.tmp_lane_point = 0
                self.tmp_target = self.scene_map.lanes[self.tmp_lane][0]
                self.mode = 'intersect'
                self.scene_map.reach_intersect(self, node)
                print("\033[0;32mThe vehicle #{} is in intersection #{}.\033[0m".format(self.index, node))
        else:
            # change a new target
            self.tmp_target = lane_points[self.tmp_lane_point]
            self.tmp_lane_point += 1

    def intersect_nav(self) -> None:
        # if the vehicle has reached the target, change to lane mode
        if self.distance < self.TARGET_THRES:
            self.tmp_lane_point = 1
            self.mode = 'lane'
            self.scene_map.leave_intersect(self, self.tmp_node)
            return

    def navigate(self, poses, lanes: np.ndarray, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam,
                 nums_area) -> Tuple[float, float]:
        # update the position and orientation data
        self.update(poses[self.index][0], poses[self.index][1])
        # force stop
        if self.stop_flag:
            return 0, 0
        # if the vehicle is too far away from the target, change to lost mode
        if self.mode == 'lost':
            self.lost_nav()
        elif self.distance > self.TARGET_RANGE:
            if self.mode == 'intersect':
                self.scene_map.leave_intersect(self, self.tmp_node)
            self.mode = 'lost'
            self.lost_nav()
        elif self.mode == 'lane':
            self.lane_nav(poses, msg_rad_cam, msg_lid_cam, nums_area)
        elif self.mode == 'intersect':
            self.intersect_nav()
        # if an error occurs, the vehicle stops
        elif self.mode == 'error':
            print("ERROR #{}".format(self.index), end='\r')
            return 0, 0
        return self.target2control(poses, lanes)

    def __repr__(self) -> str:
        return "Vehicle: {}, Mode: {}, Target: {}, Flag: {}".format(self.index, self.mode, self.tmp_target, self.stop_flag)


class DynamicMap(SceneMap):

    def __init__(self, load_path: Path) -> None:
        super().__init__(load_path)
        self.intersect_queues: List[List[Agent]] = [[] for _ in range(len(self.nodes))]

    def reach_intersect(self, vehicle: Agent, node_index: int) -> None:
        q = self.intersect_queues[node_index]
        q.append(vehicle)
        if len(q) > 1:
            vehicle.stop_flag = True

    def leave_intersect(self, vehicle: Agent, node_index: int) -> None:
        q = self.intersect_queues[node_index]
        q.remove(vehicle)
        if len(q) > 0:
            q[0].stop_flag = False


class Agents:

    def __init__(self, scene_map: DynamicMap, num: int) -> None:
        self.num = num
        self.vehicles = [Agent(scene_map, i) for i in range(num)]
        self.scene_map = scene_map

    def navigate(self, poses, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> Tuple[int, int]:
        for i, q in enumerate(self.scene_map.intersect_queues):
            print(i, end=': ')
            for v in q:
                print(v.index, end=', ')
            print()

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
