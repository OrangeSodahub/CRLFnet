#############################################################
#   This py file subscribe the topic of lidars and output a #
#   list of them.                                           #
#############################################################

import rospy
import std_msgs.msg
import message_filters
from sensor_msgs.msg import PointCloud2
# self-defined msg
from msgs.msg._ListPointCloud import *

def pointcloud_listener(cloud11, cloud12, cloud2):
    msgcloud = ListPointCloud()
    msgcloud.pointcloud.append(cloud11)
    msgcloud.pointcloud.append(cloud12)
    msgcloud.pointcloud.append(cloud2)
    # Add time stamp
    msgcloud.header = std_msgs.msg.Header()
    msgcloud.header.stamp = rospy.Time.now()
    # Publish
    pub = rospy.Publisher("/pointcloud_list", ListPointCloud, queue_size=1)
    pub.publish(msgcloud)

if __name__ == '__main__':
    rospy.init_node('lidar_listener', anonymous=True)

    sub_cloudpts_11 = message_filters.Subscriber('/velodyne1_points', PointCloud2)
    sub_cloudpts_12 = message_filters.Subscriber('/velodyne2_points', PointCloud2)
    sub_cloudpts_2 = message_filters.Subscriber('/velodyne3_points', PointCloud2)
 
    sync = message_filters.ApproximateTimeSynchronizer([sub_cloudpts_11, sub_cloudpts_12, sub_cloudpts_2], 10, 1)# syncronize time stamps
    sync.registerCallback(pointcloud_listener)
    print("PointCloud List Begin.")
    rospy.spin()