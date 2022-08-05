#!/usr/bin/env python3
"""
Subscribe the raw radar topics and publish filtered messages.
"""

import rospy
import message_filters
from per_msgs.msg._SensorMsgsRadar import SensorMsgsRadar
from per_msgs.msg._GeometryMsgsRadarObject import GeometryMsgsRadarObject
from msgs.msg._MsgRadar import MsgRadar
from msgs.msg._MsgRadarObject import MsgRadarObject


def append_obj(t: GeometryMsgsRadarObject, obj_list: list):
    obj = MsgRadarObject()
    obj.distance = t.range
    obj.velocity = t.range_rate
    obj.angle_centroid = t.angle_centroid
    obj.pos_x = t.obj_vcs_posex
    obj.pos_y = t.obj_vcs_posey
    obj.track_id = t.track_id
    obj_list.append(obj)


def radar_listener(radar2: SensorMsgsRadar, radar3: SensorMsgsRadar):
    # use the publisher in the main function
    global pub

    msg_radar = MsgRadar()
    # left
    msg_radar.num_left = int(radar2.total_front_left_esr_tracks)
    for t in radar2.front_left_esr_tracklist:
        append_obj(t, msg_radar.objects_left)
    # right
    msg_radar.num_right = int(radar3.total_front_right_esr_tracks)
    for t in radar3.front_right_esr_tracklist:
        append_obj(t, msg_radar.objects_right)
    # Add time stamp
    msg_radar.header.stamp = rospy.Time.now()
    pub.publish(msg_radar)


if __name__ == '__main__':
    # initialize ROS node
    rospy.init_node("radar_listener", anonymous=True)
    # initialize publisher
    pub = rospy.Publisher("/radar_msgs_combined", MsgRadar, queue_size=10)
    # subscribe messages
    sub_radar_2 = message_filters.Subscriber("/ARS_408_21_2_Topic", SensorMsgsRadar)
    sub_radar_3 = message_filters.Subscriber("/ARS_408_21_3_Topic", SensorMsgsRadar)
    # syncronize time stamps
    sync = message_filters.ApproximateTimeSynchronizer([sub_radar_2, sub_radar_3], 1, 1)

    sync.registerCallback(radar_listener)

    print("\033[0;32mRadar Listener Initialized successfully.\033[0m")

    rospy.spin()
