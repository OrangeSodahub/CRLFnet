#############################################################
#   This py file acts as agent representing the overpass.   #
#############################################################


#!/usr/bin/python3
import numpy as np
from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type

class Agent():
    def __init__(self, obj_threshold, muti_threshold):
        self.obj_threshold = obj_threshold
        self.muti_threshold = muti_threshold
    
    
    def is_front(vehicle: np.array, point: np.array, alpha):
        """
            only consider points that are in front of the vehicle
        """
        return abs(np.arctan2(point[1]-vehicle[1], point[0]-vehicle[0])-alpha) <= np.pi/2


    def set_obj(self, lanes: np.array, vehicle: np.array):
        """
            set objective & if need to make decision
        """
        dists = np.array([np.array([np.linalg.norm(point - vehicle) for point in lane]) for lane in lanes])
        while np.min(dists) < self.obj_threshold:                # remove the nearer points
            loc = np.where(dists==np.min(dists))
            for x, y in zip(loc[0], loc[1]):
                dists[x, y] = np.inf
        obj_dist = np.min(dists)
        obj_loc = np.where(dists==obj_dist)
        obj = lanes[obj_loc[0][0]][obj_loc[1][0]]

        candi_obj = [obj]
        for i, dist in enumerate(dists):                         # whether to make decision
            if obj_loc[0][0] == i:
                continue
            if abs(np.min(dist)-obj_dist) <= self.muti_threshold:
                candit_obj_loc = np.where(dists==np.min(dist))
                candi_obj.append(lanes[candit_obj_loc[0][0]][candit_obj_loc[1][0]])

        return candi_obj
        

    def set_control(self, lanes: np.array, vehicle: np.array, alpha, msgradcam: MsgRadCam, msglidcam: MsgLidCam):
        candi_obj, is_need = self.set_obj(lanes, vehicle)
        if len(candi_obj) != 1:                                 # need to make decision
                                                                # caculate the density of vehicles
            pass
        else:                                                   # only one objective
            obj = candi_obj[0]
            diff = np.arctan2(obj[1]-vehicle[1], obj[0]-vehicle[0]) - alpha
            turn = 1 if diff > 0 else -1                        # left: turn=1; right: turn = -1
            return turn, 1                                      # return angle, speed