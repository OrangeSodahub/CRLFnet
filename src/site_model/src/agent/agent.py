#!/usr/bin/python3


from pathlib import Path
import numpy as np

from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type

from .scene import SceneMap


MODES = ['lane', 'intersection', 'lost', 'await']


class Agent:

    def __init__(self, obj_threshold, multi_threshold, lanes_path: Path, scene_map: SceneMap) -> None:

        self.LEN = 0.163974         # the length between the front wheel and the rear wheel
        self.MAX_STEER = np.pi / 4
        self.TARGET_RANGE = 1.0
        self.TARGET_THRES = 0.25
        self.scene_map = scene_map

        self.mode = 'lost'
        self.pos = np.array([0, 0])
        self.orient = 0
        self.distance = 0
        self.tmp_target = np.array([0, 0])
        self.tmp_lane = -1
        self.tmp_lane_point = -1

        self.obj_threshold = obj_threshold
        self.multi_threshold = multi_threshold
        self.lanes = []
        for i in range(6):
            pth = str(lanes_path.joinpath("{}.txt".format(i)))
            lane = np.loadtxt(pth, dtype=np.float64)
            self.lanes.append(lane)
        self.nodes = [[],
                      [],
                      [],
                      []]
        self.lane = -1

    def is_front(self, vehicle: np.ndarray, point: np.ndarray, alpha):
        """
            only consider points that are in front of the vehicle
        """
        return abs(np.arctan2(point[1]-vehicle[1], point[0]-vehicle[0])-alpha) <= np.pi*2/3

    def get_mindist(self, dists):
        min_dist = np.inf
        lane: int = -1
        for i, dist in enumerate(dists):
            if np.min(dist) < min_dist and np.min(dist) >= self.obj_threshold:
                min_dist = np.min(dist)
                lane = i
        if lane == -1:
            return lane, -1
        loc = np.where(dists[lane]==min_dist)[0][0]
        return lane, loc

    def set_lane(self, vehicle: np.ndarray, alpha):
        if self.lane == -1:                                     # no current lane
            dists = [np.array([np.linalg.norm(point - vehicle) if self.is_front(vehicle, point, alpha) else np.inf for point in lane]) for lane in self.lanes]
        else:                                                   # not at nodes
            dists = [np.array([np.linalg.norm(point - vehicle) if self.is_front(vehicle, point, alpha) else np.inf for point in self.lanes[self.lane]])]
        lane, loc = self.get_mindist(dists)
        return lane, loc

    def set_obj(self, vehicle: np.ndarray, alpha):
        """
            set objective
        """
        lane, loc = self.set_lane(vehicle, alpha)
        if loc == -1:                                           # no candidate objectives in front of vehicle
            return []
        if loc == -2:
            self.lane = lane                                    # switch lane

        obj_loc = [self.lane, loc]
        obj = self.lanes[obj_loc[0]][obj_loc[1]]
        return [obj]

    def set_control(self, vehicle: np.ndarray, alpha, msgradcam: MsgRadCam, msglidcam: MsgLidCam):
        """
        return the speed and angle to the vehicle
        """
        candi_obj = self.set_obj(vehicle, alpha)
        if len(candi_obj) == 0:                                 # no candidate objectives: fall back
            return 0, -1
        else:                                                   # only one objective
            obj = candi_obj[0]
        print("obj:", obj, end='\r')
        diff = np.arctan2(obj[1]-vehicle[1], obj[0]-vehicle[0]) - alpha
        turn = diff / (np.pi/4) if abs(diff) <= np.pi/4 else np.sign(diff)          # left: turn=1; right: turn = -1
        return turn, 1                                                              # return angle, speed



    def update(self, pos: np.ndarray, orient: float) -> None:
        self.pos = pos
        self.orient = orient
        self.distance = np.linalg.norm(self.tmp_target - self.pos)

    def target2control(self) -> tuple:
        yaw = np.arctan2(self.tmp_target[1] - self.pos[1], self.tmp_target[0] - self.pos[0]) - self.orient
        distance = np.linalg.norm(self.tmp_target - self.pos)   # do not use self.distance !!!
        sin_rot = np.clip(2 * self.LEN * np.sin(yaw) / distance, -1, 1 )
        rotation = np.arcsin(sin_rot)
        steer = np.clip(rotation / self.MAX_STEER, -1, 1) 
        throttle = 1 if abs(yaw) < np.pi / 2 else -1
        return steer, throttle

    def choose_way(self, node: int) -> int:
        """Choose an accessable lane randomly."""
        lanes = self.scene_map.accessable_lanes(node)
        if len(lanes) == 0:
            return -1
        lane = np.random.choice(lanes)
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

    def lane_nav(self) -> None:
        # if the vehicle hasn't reached the target, do not change the target
        if self.distance > self.TARGET_THRES:
            return 
        # if the vehicle has reached the target
        lane = self.scene_map.lanes[self.tmp_lane]
        # if the vehicle is at the end of the lane, change to intersect mode
        if self.tmp_lane_point >= len(lane):
            node = self.scene_map.accessable_node(self.tmp_lane)
            self.tmp_lane = self.choose_way(node)
            if self.tmp_lane == -1:
                self.mode = 'await'
                print("\033[0;31mError: The vehicle is in a dead end.\033[0m")
            else:
                self.tmp_lane_point = 0
                self.tmp_target = self.scene_map.lanes[self.tmp_lane][0]
                self.mode = 'intersection'
                print("\033[0;32mThe vehicle is in intersection #{}.\033[0m".format(node))
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
            self.lane_nav()
        elif self.mode == 'intersection':
            self.intersect_nav()
        # if an error occurs, the vehicle stops
        elif self.mode == 'await':
            print("AWAIT MODE", end='\r')
            return 0, 0
        print("Mode: {}, Target: {}".format(self.mode, self.tmp_target), end='\r')
        return self.target2control()
