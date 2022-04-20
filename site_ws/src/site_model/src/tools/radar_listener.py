#############################################################
#   This py file subscribe the topic of radars and save     #
#	the poses information of vehicles.						#
#   Author: Yangxiuyu                                       #
#############################################################

import ros
from sqlalchemy import true
import rospy
from per_msgs.msg._SensorMsgsRadar import * # Radar message class
from radar_msgs.msg._MsgRadar import *
from radar_msgs.msg._MsgObject import *

def radar_listener():
    rospy.init_node("radar_listener", anonymous=true)

    sub = rospy.Subscriber("/ARS_408_21_2_Topic", 10, msgs_publish)
    rospy.spin()
    

def msgs_publish(msgs: SensorMsgsRadar):
    """
        Receive per_msgs::SensorMsgsRadar continuously
        Publish radar_msgs::MsgRadar at a rate of 10Hz
    """
    msgradar = MsgRadar()
    if msgs.front_left_esr_tracker_counter != 0: # if num of vehicles is not 0
       msgradar.total_vehicles = msgs.front_left_esr_tracker_counter
       for i in range(msgradar.total_vehicles):
           object = MsgObject() # define a new list
           object.obj_vcs_posex = msgs.front_left_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = msgs.front_left_esr_tracklist[i].obj_vcs_posey


    pub = rospy.Publisher("radar_msgs", msgradar) # MsgRadar is the defined message type
    rate = rospy.Rate(10) # publish msgs rated at 10Hz


if __name__ == '__main__':
    try:
        radar_listener()
    except rospy.ROSInterruptException:
        pass