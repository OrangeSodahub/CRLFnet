#############################################################
#   This py file subscribe the topic of cameras and publish #
#   the integrated information.                             #
#############################################################

from sqlalchemy import true
import rospy
from sensor_msgs.msg import Image
from msgs.msg._MsgCamera import *  # camera msgs class
import std_msgs.msg
import numpy as np
import message_filters

def camera_listener(image11, image12, image13, image14, image41, image42, image43, image44, ):
    # integrate
    msgcamera = MsgCamera()
    mark = [image11, image12, image13, image14, image41, image42, image43, image44]
    for i in mark:
        msgcamera.camera.append(i)
        # print(type(i))

    # Add time stamp
    msgcamera.header = std_msgs.msg.Header()
    msgcamera.header.stamp = rospy.Time.now()
    # Publish
    pub = rospy.Publisher("/camera_msgs_combined", MsgCamera, queue_size=1)
    pub.publish(msgcamera)
    # print(msgcamera.header)

if __name__ == '__main__':
    rospy.init_node('camera_listener', anonymous=True)

    sub_image_11 = message_filters.Subscriber('/image_raw_11', Image)
    sub_image_12 = message_filters.Subscriber('/image_raw_12', Image)
    sub_image_13 = message_filters.Subscriber('/image_raw_13', Image)
    sub_image_14 = message_filters.Subscriber('/image_raw_14', Image)
    sub_image_41 = message_filters.Subscriber('/image_raw_41', Image)
    sub_image_42 = message_filters.Subscriber('/image_raw_42', Image)
    sub_image_43 = message_filters.Subscriber('/image_raw_43', Image)
    sub_image_44 = message_filters.Subscriber('/image_raw_44', Image)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_image_11, sub_image_12, sub_image_13, sub_image_14, 
                                                        sub_image_41, sub_image_42, sub_image_43, sub_image_44], 10, 1)# syncronize time stamps
    sync.registerCallback(camera_listener)
    print("Camera Listener Begin.")
    rospy.spin()