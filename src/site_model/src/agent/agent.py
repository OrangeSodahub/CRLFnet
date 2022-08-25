# !/usr/bin/python3

from pathlib import Path
from typing import Tuple, List
import numpy as np

from msgs.msg._MsgRadCam import MsgRadCam  # radar camera fusion message type
from msgs.msg._MsgLidCam import MsgLidCam  # lidar camera fusion message type

from .scene import SceneMap

MODES = ['lane', 'node', 'lost', 'error']


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

    def target2control(self, poses, lanes: np.ndarray) -> Tuple[float, float]:
        v_control = self.is_collide(poses, lanes)
        v_control = 1
        if not v_control:
            return 0, 0
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        yaw = (yaw + np.pi) % (2 * np.pi) - np.pi
        distance = np.linalg.norm(self.tmp_target - self.pos)  # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1)
        rotation = np.arcsin(sin_rot)
        steer = np.clip(rotation / self.MAX_STEER, -1, 1)
        throttle = (1 if abs(yaw) < np.pi / 2 else -1) * v_control
        self.throttle = throttle
        return steer, throttle

    def choose_way(self, node: int, from_lane: int, vehicles, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam, mode: str = 'random') -> int:
        # get accessible
        accessible_lanes = self.scene_map.accessible_lanes(node, from_lane)
        if len(accessible_lanes) == 0:
            return -1
        if mode == 'random':
            lane = np.random.choice(accessible_lanes)
        elif mode == 'odom':
            lane = self.scene_map.score_lanes(accessible_lanes, vehicles)
        elif mode == 'fusion':
            lane = self.scene_map.score_lanes_2(msg_rad_cam, msg_lid_cam)
        else:
            raise ValueError("Illegal choose-way mode.")
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

    def lane_nav(self, vehicles, msg_rad_cam, msg_lid_cam) -> None:
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
        self.tmp_lane = self.choose_way(node, self.tmp_lane, vehicles, msg_rad_cam, msg_lid_cam)
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

    def navigate(self, poses: Tuple[np.ndarray, float], lanes: np.ndarray, vehicles, msg_rad_cam: MsgRadCam,
                 msg_lid_cam: MsgLidCam) -> Tuple[float, float]:
        # update the position and orientation data
        self.update(poses[self.index][0], poses[self.index][1])
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
            self.lane_nav(vehicles, msg_rad_cam, msg_lid_cam)
        elif self.mode == 'node':
            self.node_nav()
        elif self.mode == 'error':
            print("\033[0;31mERROR #{}\033[0m".format(self.index), end='\n')
            return 0, 0
        return self.target2control(poses, lanes)

    def __repr__(self) -> str:
        return "Index: {},\tMode: {},\tFlag: {},\tTarget: {}".format(self.index, self.mode, self.stop_flag, self.tmp_target)


def calc_num(vehicles: List[Agent]):
    """temporarily using vehicles num"""
    nums_area = [0, 0, 0, 0]  # intersection, circle, overpass, outerring
    for v in vehicles:
        if v.tmp_lane == 10:
            nums_area[2] += 1
        elif 0.0 <= v.pos[1] <= 1.7 and -1.2 <= v.pos[0] <= 1.0:
            nums_area[0] += 1
        elif -2.2 <= v.pos[1] < 0.0 and -1.2 <= v.pos[0] <= 1.0:
            nums_area[1] += 1
        else:
            nums_area[3] += 1
    return nums_area


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

    def score_lanes(self, accessible_lanes: np.ndarray, vehicles: List[Agent]) -> int:
        nums_area = calc_num(vehicles)
        poses = [v.pos for v in vehicles]
        """Calculate weighted score of accessible lanes."""

        def set_weight(orient, nums_area):
            nums_index = np.argsort(nums_area) + 1
            return (np.where(nums_index == orient)[0][0] + 1)

        lane_num = [0] * len(accessible_lanes)
        for i, lane in enumerate(accessible_lanes):
            # dists = np.array([[np.linalg.norm(np.array([v.pos_x, v.pos_y]), pt) for pt in self.lanes[lane]] for v in (msg_lid_cam.objects_circle+msg_lid_cam.objects_intersection)])
            dists = np.array([[np.linalg.norm(p[0] - pt) for pt in self.lanes[lane]] for p in poses])
            dists_convert = dists <= 0.05
            lane_num[i] += np.sum(dists_convert)
        lane_orient = [self.lane_in_area[lane] for lane in accessible_lanes]
        # nums_area = [msg_lid_cam.num_intersection, msg_lid_cam.objects_circle, msg_rad_cam.num_overpass]
        lane_weight = [set_weight(orient, nums_area) for orient in lane_orient]
        lane_score = [a * b for a, b in zip(lane_num, lane_weight)]
        return accessible_lanes[np.where(lane_score == np.min(lane_score))[0][0]]

    def score_lanes_2(self, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> int:
        pass


class Agents:

    def __init__(self, scene_map: DynamicMap, num: int) -> None:
        self.vehicles = [Agent(scene_map, i) for i in range(num)]
        self.scene_map = scene_map

    def navigate(self, poses, msg_rad_cam: MsgRadCam, msg_lid_cam: MsgLidCam) -> Tuple[int, int]:
        for v in self.vehicles:
            print(v)
        for i, q in enumerate(self.scene_map.intersect_queues):
            print("Node", i, end=': ')
            for v in q:
                print(v.index, end=', ')
            print()

        lanes = [v.tmp_lane for v in self.vehicles]

        steers, throttles = [], []
        for v in self.vehicles:
            steer, throttle = v.navigate(poses, lanes, self.vehicles, msg_rad_cam, msg_lid_cam)
            steers.append(steer)
            throttles.append(throttle)
        return steers, throttles
