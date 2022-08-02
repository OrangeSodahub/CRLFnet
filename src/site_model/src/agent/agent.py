#############################################################
#   This py file acts as agent representing the overpass.   #
#############################################################


#!/usr/bin/python3
import numpy as np
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
        print(self.lanes)
    
    
    def is_front(vehicle: np.array, point: np.array, alpha):
        """
            only consider points that are in front of the vehicle
        """
        return abs(np.arctan2(point[1]-vehicle[1], point[0]-vehicle[0])-alpha) <= np.pi/2


    def get_mindist(self, dists):
        min_dist = np.inf
        lane: int
        for i, dist in enumerate(dists):
            if np.min(dist) < min_dist:
                min_dist = np.min(dist)
                lane = i
        loc = np.where(dists[lane]==min_dist)[0][0]
        return lane, loc, min_dist
                    

    def set_obj(self, vehicle: np.array):
        """
            set objective & if need to make decision
        """
        dists = [np.array([np.linalg.norm(point - vehicle) for point in lane]) for lane in self.lanes]
        lane, loc, min_dist = self.get_mindist(dists)
        while min_dist < self.obj_threshold:                     # remove the nearer points
            print("lane:", lane, "loc:", loc)
            dists[lane][loc] = np.inf
            lane, loc, min_dist = self.get_mindist(dists)

        obj_loc = [lane, loc]
        obj = self.lanes[obj_loc[0]][obj_loc[1]]

        candi_obj = [obj]
        for i, dist in enumerate(dists):                         # whether to make decision
            if obj_loc[0] == i:
                continue
            if abs(np.min(dist)-min_dist) <= self.multi_threshold:
                candit_obj_loc = np.where(dists[i]==np.min(dist))[0][0]
                candi_obj.append(self.lanes[i][candit_obj_loc])

        return candi_obj
        

    def set_control(self, vehicle: np.array, alpha, msgradcam: MsgRadCam, msglidcam: MsgLidCam):
        candi_obj = self.set_obj(vehicle)
        if len(candi_obj) != 1:                                 # need to make decision
            print("need to make decision.")
                                                                # caculate the density of vehicles
            pass
        else:                                                   # only one objective
            obj = candi_obj[0]
            print("obj:", obj)
            diff = np.arctan2(obj[1]-vehicle[1], obj[0]-vehicle[0]) - alpha
            turn = 1 if diff > 0 else -1                        # left: turn=1; right: turn = -1
            return turn, 1                                      # return angle, speed