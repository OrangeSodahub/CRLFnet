#############################################################
#   This py file subscribe the topic of cameras and publish #
#   the integrated information.                             #
#   Author: Yangxiuyu                                       #
#############################################################

from sqlalchemy import true
import rospy
from camera_msgs.msg._MsgObject import * 
from camera_msgs.msg._MsgCamera import * # camera msgs class
from sensor_msgs.msg import Image
import std_msgs.msg

msgcamera = MsgCamera()

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
           object = MsgObject()
           object.obj_vcs_posex = msgs.front_right_esr_tracklist[i].obj_vcs_posex
           object.obj_vcs_posey = msgs.front_right_esr_tracklist[i].obj_vcs_posey
           object.range_rate = msgs.front_right_esr_tracklist[i].range_rate
           msgradar.ObjectList_right.append(object)

    pub = rospy.Publisher("/radar_msgs_combined", MsgRadar) # MsgRadar is the defined message type
    # rate = rospy.Rate(10) # publish msgs rated at 10Hz
    MsgRadar.header = std_msgs.msg.Header()
    MsgRadar.header.stamp = rospy.Time.now() # Add time stamp
    pub.publish(msgradar)
    # rate.sleep()


if __name__ == '__main__':
    try:
        radar_listener()
    except rospy.ROSInterruptException:
        pass