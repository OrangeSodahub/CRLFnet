#!/usr/bin/env python
from __future__ import print_function

import roslib
#roslib.load_manifest('zed_wrapper')
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def callback(data):
  bridge = CvBridge()
  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv2.imshow("zdjecie", cv_image)
  cv2.waitKey(3)


if __name__ == '__main__':
  rospy.init_node('image_reader', anonymous=True)
  image_sub = rospy.Subscriber("/zed_node/left/image_rect_color",Image,callback)
  rospy.spin()