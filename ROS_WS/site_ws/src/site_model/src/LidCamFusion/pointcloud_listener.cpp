/*###########################################################
#   This py file subscribe the topic of lidars and publish  #
#   the integrated information.                             #
###########################################################*/

#include <ros/ros.h>
#include <pcl/point_cloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/io/pcd_io.h>
// point types
#include <pcl/point_types.h>
// approximate time synchoronizer
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
using namespace std;
using namespace sensor_msgs;
using namespace message_filters;

typedef pcl::PointXYZI PointT; // 注意点云格式是：XYZ还是XYZRGB,XYZI
typedef pcl::PointCloud<PointT> PointCloudT;

#define lidar11_x -0.55740706
#define lidar11_y 1.25432157
#define lidar11_z 0.006

#define lidar12_x 0.43254243
#define lidar12_y 0.26437207
#define lidar12_z 0.006

#define lidar2_x 9.74248361e-04
#define lidar2_y -9.89292350e-01
#define lidar2_z 1.91780397e-01

// from unittest import result
// import rospy
// from sensor_msgs.msg import PointCloud2
// import std_msgs.msg
// import numpy as np
// import message_filters

// def pointcloud_listener(cloud11, cloud12, cloud2):
//     # lidar_poses get from 'lidar_pose.py'
//     lidar11 = [-0.55740706, 1.25432157, 0.006]
//     lidar12 = [0.43254243, 10.26437207, 0.006]
//     lidar2 = [9.74248361e-04, -9.89292350e-01, 1.91780397e-01]
//     # fix the pointclouds
//     cloud11_fixed = point_cloud_fix(cloud11, lidar11)
//     cloud12_fixed = point_cloud_fix(cloud12, lidar12)
//     cloud2_fixed = point_cloud_fix(cloud2, lidar2)

//     # msgcloud = PointCloud2()
//     # # Add time stamp
//     # msgcloud.header = std_msgs.msg.Header()
//     # msgcloud.header.stamp = rospy.Time.now()
//     # # Publish
//     # pub = rospy.Publisher("/cloud_msgs_combined", PointCloud2, queue_size=1)
//     # pub.publish(msgcloud)

// def point_cloud_fix(cloud: PointCloud2, lidar_pose:yy np.array):
//     result = PointCloud2()
//     print(cloud.data.)

//     return result

// if __name__ == '__main__':
//     rospy.init_node('camera_listener', anonymous=True)

//     sub_cloudpts_11 = message_filters.Subscriber('/velodyne1_points', PointCloud2)
//     sub_cloudpts_12 = message_filters.Subscriber('/velodyne2_points', PointCloud2)
//     sub_cloudpts_2 = message_filters.Subscriber('/velodyne3_points', PointCloud2)
 
//     sync = message_filters.ApproximateTimeSynchronizer([sub_cloudpts_11, sub_cloudpts_12, sub_cloudpts_2], 10, 1)# syncronize time stamps
//     sync.registerCallback(pointcloud_listener)
//     print("Begin.")
//     rospy.spin()
void pointcloud_listener(const PointCloud2& cloud11, const PointCloud2& cloud12, const PointCloud2& cloud2)
{
    // Transform cloud from type sensor_msgs::PointCloud2 to pcl::PointCloud
    PointCloudT cloud11_pcl, cloud12_pcl, cloud2_pcl;
    pcl::fromROSMsg(cloud11, cloud11_pcl);
    pcl::fromROSMsg(cloud12, cloud12_pcl);
    pcl::fromROSMsg(cloud2, cloud2_pcl);

    // Fix locations
    for(int i=0;i<cloud2_pcl.points.size();i++)
    {
        // cloud11
        if(i<cloud11_pcl.points.size())
        {
            cloud11_pcl.points[i].x += lidar11_x;
            cloud11_pcl.points[i].y += lidar11_y;
            cloud11_pcl.points[i].z += lidar11_z;
        }
        // cloud12
        if(i<cloud12_pcl.points.size())
        {
            cloud12_pcl.points[i].x += lidar12_x;
            cloud12_pcl.points[i].y += lidar12_y;
            cloud12_pcl.points[i].z += lidar12_z;
        }
        cloud2_pcl.points[i].x += lidar2_x;
        cloud2_pcl.points[i].y += lidar2_y;
        cloud2_pcl.points[i].z += lidar2_z;
    }

    // Combine
    PointCloudT cloud = cloud11_pcl + cloud12_pcl + cloud2_pcl;

    // Publish
    ros::NodeHandle nh_pub;
    ros::Publisher pub = nh_pub.advertise<PointCloud2>("/point_cloud_combined", 1);
    PointCloud2 output;
    pcl::toROSMsg(cloud, output);
    output.header.frame_id = "point_cloud";
    output.header.stamp = ros::Time::now();
    pub.publish(output);
    cout << "Point Cloud Combined." << endl;
}

int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_listener");
    ros::NodeHandle nh;

    message_filters::Subscriber<PointCloud2> cloud11(nh, "/velodyne1_points", 1);
    message_filters::Subscriber<PointCloud2> cloud12(nh, "/velodyne2_points", 1);
    message_filters::Subscriber<PointCloud2> cloud2(nh, "/velodyne3_points", 1);
    typedef sync_policies::ApproximateTime<PointCloud2,PointCloud2,PointCloud2> SyncPolicy;
    Synchronizer<SyncPolicy> sync(SyncPolicy(10), cloud11, cloud12, cloud2);
    sync.registerCallback(boost::bind(pointcloud_listener, _1, _2, _3));
    ros::spin();

    return 0;
}
