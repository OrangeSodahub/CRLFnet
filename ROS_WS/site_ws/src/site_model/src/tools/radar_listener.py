#############################################################
#   This py file subscribe the topic of radars and save     #
#	the poses information of vehicles.						#
#   Author: Yangxiuyu                                       #
#############################################################

from sqlalchemy import true
import rospy
from per_msgs.msg._SensorMsgsRadar import *
# radar message type
from msgs.msg._MsgRadar import *
from msgs.msg._MsgRadarObject import *
import message_filters

def radar_listener(radar2: SensorMsgsRadar, radar3: SensorMsgsRadar):
    msgradar = MsgRadar()
    if radar2.total_front_left_esr_tracks != 0: # if num of vehicles is not 0
        msgradar.total_vehicles_left = round(radar2.total_front_left_esr_tracks)
        for i in range(msgradar.total_vehicles_left):
           object = MsgRadarObject() # define a new list
           object.obj_vcs_posex = radar2.front_left_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = radar2.front_left_esr_tracklist[i].obj_vcs_posey
           object.range_rate = radar2.front_left_esr_tracklist[i].range_rate
           msgradar.ObjectList_left.append(object)

    if radar3.total_front_right_esr_tracks !=0:
        msgradar.total_vehicles_right = round(radar3.total_front_right_esr_tracks)
        for i in range(msgradar.total_vehicles_right):
           object = MsgRadarObject()
           object.obj_vcs_posex = radar3.front_right_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = radar3.front_right_esr_tracklist[i].obj_vcs_posey
           object.range_rate = radar3.front_right_esr_tracklist[i].range_rate
           msgradar.ObjectList_right.append(object)

    pub = rospy.Publisher("/radar_msgs_combined", MsgRadar) # MsgRadar is the defined message type
    msgradar.header.stamp = rospy.Time.now() # Add time stamp
    pub.publish(msgradar)

if __name__ == '__main__':
    rospy.init_node("radar_listener", anonymous=true)

    sub_radar_2 = message_filters.Subscriber("/ARS_408_21_2_Topic", SensorMsgsRadar)
    sub_radar_3 = message_filters.Subscriber("/ARS_408_21_3_Topic", SensorMsgsRadar)

    sync = message_filters.ApproximateTimeSynchronizer([sub_radar_2, sub_radar_3], 1, 1)

    sync.registerCallback(radar_listener)
    print("Radar Listener Begin.")
    rospy.spin()