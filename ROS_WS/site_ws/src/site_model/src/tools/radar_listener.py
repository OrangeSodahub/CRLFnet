#############################################################
#   This py file subscribe the topic of radars and save     #
#	the poses information of vehicles.						#
#   Author: Yangxiuyu                                       #
#############################################################

from sqlalchemy import true
import rospy
from per_msgs.msg._SensorMsgsRadar import * # Radar message class
from radar_msgs.msg._MsgRadar import *
from radar_msgs.msg._MsgObject import *

msgradar = MsgRadar()

def radar_listener():
    rospy.init_node("radar_listener", anonymous=true)

    sub2 = rospy.Subscriber("/ARS_408_21_2_Topic", SensorMsgsRadar, msgs_publish_2)
    sub3 = rospy.Subscriber("/ARS_408_21_3_Topic", SensorMsgsRadar, msgs_publish_3)
    rospy.spin()    

def msgs_publish_2(msgs: SensorMsgsRadar):
    """
        Receive per_msgs::SensorMsgsRadar continuously
        Publish radar_msgs::MsgRadar at a rate of 10Hz
    """
    if msgs.total_front_left_esr_tracks != 0: # if num of vehicles is not 0
        msgradar.total_vehicles_left = round(msgs.total_front_left_esr_tracks)
        msgradar.ObjectList_left.clear() # every time write msgs clear lists first
        for i in range(msgradar.total_vehicles_left):
           object = MsgObject() # define a new list
           object.obj_vcs_posex = msgs.front_left_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = msgs.front_left_esr_tracklist[i].obj_vcs_posey
           object.range_rate = msgs.front_left_esr_tracklist[i].range_rate
           msgradar.ObjectList_left.append(object)

def msgs_publish_3(msgs: SensorMsgsRadar):
    if msgs.total_front_right_esr_tracks !=0:
        msgradar.total_vehicles_right = round(msgs.total_front_right_esr_tracks)
        msgradar.ObjectList_right.clear()
        for i in range(msgradar.total_vehicles_right):
           object = MsgObject() # define a new list
           object.obj_vcs_posex = msgs.front_right_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = msgs.front_right_esr_tracklist[i].obj_vcs_posey
           object.range_rate = msgs.front_right_esr_tracklist[i].range_rate
           msgradar.ObjectList_right.append(object)

    pub = rospy.Publisher("/radar_msgs", MsgRadar) # MsgRadar is the defined message type
    rate = rospy.Rate(10) # publish msgs rated at 10Hz
    pub.publish(msgradar)


if __name__ == '__main__':
    try:
        radar_listener()
    except rospy.ROSInterruptException:
        pass