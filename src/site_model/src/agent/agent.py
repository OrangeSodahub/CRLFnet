#!/usr/bin/python3
import numpy as np
import random
from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type

class Agent():
    def __init__(self, obj_threshold, multi_threshold, lanes_path):
        self.obj_threshold = obj_threshold
        self.multi_threshold = multi_threshold
        self.lanes = []
        for i in range(6):
            lane = np.loadtxt(lanes_path+"/"+str(i)+".txt", dtype=np.float64)
            self.lanes.append(lane)
        self.nodes = [[],
                      [],
                      [],
                      []]
        self.lane = -1
    
    
    def is_front(self, vehicle: np.array, point: np.array, alpha):
        """
            only consider points that are in front of the vehicle
        """
        return abs(np.arctan2(point[1]-vehicle[1], point[0]-vehicle[0])-alpha) <= np.pi*2/3


    def is_node(self, vehicle: np.array):
        pass


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


    def set_lane(self, vehicle: np.array, alpha):
        if self.lane == -1:                                     # no current lane
            dists = [np.array([np.linalg.norm(point - vehicle) if self.is_front(vehicle, point, alpha) else np.inf for point in lane]) for lane in self.lanes]
        elif self.is_node(vehicle):                             # if at nodes
            # need to make decision
            return lane, -2
        else:                                                   # not at nodes
            dists = [np.array([np.linalg.norm(point - vehicle) if self.is_front(vehicle, point, alpha) else np.inf for point in self.lanes[self.lane]])]
        lane, loc = self.get_mindist(dists)
        return lane, loc


    def set_obj(self, vehicle: np.array, alpha):
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
        

    def set_control(self, vehicle: np.array, alpha, msgradcam: MsgRadCam, msglidcam: MsgLidCam):
        """
            return the speed and angle to the vehicle
        """
        candi_obj = self.set_obj(vehicle, alpha)
        if len(candi_obj) == 0:                                 # no candidate objectives: fall back
            return 0, -1
        else:                                                   # only one objective
            obj = candi_obj[0]
        print("obj:", obj)
        diff = np.arctan2(obj[1]-vehicle[1], obj[0]-vehicle[0]) - alpha
        turn = diff / (np.pi/4) if abs(diff) <= np.pi/4 else np.sign(diff)          # left: turn=1; right: turn = -1
        return turn, 1                                                              # return angle, speed