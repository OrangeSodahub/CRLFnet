#############################################################
#   This py file subscribe the topic of lidars and output a #
#   list of them.                                           #
#############################################################

import rospy
from pointcloud_msgs.msg import _MsgObject
from pointcloud_msgs.msg import _MsgPointCloud
import std_msgs.msg
import numpy as np
import message_filters

def pointcloud_listener(cloud11, cloud12, cloud2):
    msgcloud = _MsgPointCloud.MsgPointCloud()
    msgcloud.pointcloud.append(cloud11, cloud12, cloud2)
    # Add time stamp
    msgcloud.header = std_msgs.msg.Header()
    msgcloud.header.stamp = rospy.Time.now()
    # Publish
    pub = rospy.Publisher("/pointcloud_list", _MsgPointCloud, queue_size=1)
    pub.publish(msgcloud)

if __name__ == '__main__':
    rospy.init_node('camera_listener', anonymous=True)

    sub_cloudpts_11 = message_filters.Subscriber('/velodyne1_points', _MsgObject)
    sub_cloudpts_12 = message_filters.Subscriber('/velodyne2_points', _MsgObject)
    sub_cloudpts_2 = message_filters.Subscriber('/velodyne3_points', _MsgObject)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_cloudpts_11, sub_cloudpts_12, sub_cloudpts_2], 10, 1)# syncronize time stamps
    sync.registerCallback(pointcloud_listener)
    print("Begin.")
    rospy.spin()