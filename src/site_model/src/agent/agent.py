#############################################################
#   This py file acts as agent representing the overpass.   #
#############################################################


import message_filters
from msgs.msg._MsgRadCam import *   # radar camera fusion message type
from msgs.msg._MsgLidCam import *   # lidar camera fusion message type


class Agent():
    def __init__(self, config: dict):
        self.config = config

        sub_msgradcam = message_filters.Subscriber('/radar_camera_fused', MsgRadCam)
        sub_msglidcam = message_filters.Subscriber('/lidar_camera_fused', MsgLidCam)
 
        sync = message_filters.ApproximateTimeSynchronizer([sub_msgradcam, sub_msglidcam], 1, 1)    # syncronize time stamps
        sync.registerCallback(self.perception)
        print("Agent Set.")

    def perception(self, msgradcam: MsgRadCam, msglidcam: MsgLidCam):
        print("perception")
        AREA_CIRCLE = self.config['ground']['width'] * self.config['ground']['len_circle']
        AREA_INTERSECTION = self.config['ground']['width'] * self.config['ground']['len_interection']
        AREA_OVERPASS = self.config['ground']['width'] * self.config['ground']['len_overpass']
        # caculate the density of vehicles
        self.density_overpass = msgradcam.num_overpass / AREA_OVERPASS
        self.density_circle = msglidcam.num_circle / AREA_CIRCLE
        self.density_intersection = msglidcam.num_intersection / AREA_INTERSECTION

    def command(self):
        print(self.density_overpass, self.density_circle, self.density_intersection)
