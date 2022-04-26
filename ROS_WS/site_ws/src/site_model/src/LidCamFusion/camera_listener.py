#############################################################
#   This py file subscribe the topic of cameras and publish #
#   the integrated information.                             #
#   Author: Yangxiuyu                                       #
#############################################################

from sqlalchemy import true
import rospy
from camera_msgs.msg._MsgObject import * 
from camera_msgs.msg._MsgCamera import * # camera msgs class
import std_msgs.msg
import numpy as np
import message_filters

msgcamera = MsgCamera()

def camera_listener(image11, image12, image13, image14, image41, image42, image43, image44):
    

if __name__ == '__main__':
    rospy.init_node('/camera_msgs_combined', anonymous=True)

    sub_image_11 = message_filters.Subscriber('/image_raw_11', MsgObject)
    sub_image_12 = message_filters.Subscriber('/image_raw_12', MsgObject)
    sub_image_13 = message_filters.Subscriber('/image_raw_13', MsgObject)
    sub_image_14 = message_filters.Subscriber('/image_raw_14', MsgObject)
    sub_image_41 = message_filters.Subscriber('/image_raw_41', MsgObject)
    sub_image_42 = message_filters.Subscriber('/image_raw_42', MsgObject)
    sub_image_43 = message_filters.Subscriber('/image_raw_43', MsgObject)
    sub_image_44 = message_filters.Subscriber('/image_raw_44', MsgObject)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_image_11, sub_image_12, sub_image_13, sub_image_14, 
                                                        sub_image_41, sub_image_42, sub_image_43, sub_image_44], 10, 1)# syncronize time stamps
    sync.registerCallback(camera_listener)
    print("Begin.")
    rospy.spin()