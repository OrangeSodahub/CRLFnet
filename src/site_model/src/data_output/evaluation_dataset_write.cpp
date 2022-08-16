#include <ros/ros.h>
//msgs type and conversion
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
//pcd io
#include <pcl/io/pcd_io.h>
//point types
#include <pcl/point_types.h>
//image types
#include "msgs/MsgCamera.h"
#include <sensor_msgs/Image.h>
//odom types
#include <nav_msgs/Odometry.h>
//time synchornizer
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
 
int i = 0;
int odom_list[4000][6];
void writter(const sensor_msgs::PointCloud2 &pcd, const msgs::MsgCamera &img, const nav_msgs::Odometry &odom)
{
    std::string num = std::to_string(i);
    pcl::PointCloud<pcl::PointXYZI> cloud;

    //save pcd
    pcl::fromROSMsg(pcd, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/CRLFnet/src/site_model/dataset/test_dataset/pcd/"+num+".pcd", cloud)>=0)
    {std::cerr << "Saved pcd_" << num << " " << cloud.points.size() << "points have been written" << std::endl;}
    //save img
    //save odom

    i ++;
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_write");
    ros::NodeHandle nh;

    message_filters::Subscriber<sensor_msgs::PointCloud2> pcd_sub(nh, "/point_cloud_combined", 1);
    message_filters::Subscriber<msgs::MsgCamera> img_sub(nh, "/camera_msgs_combined", 1);
    message_filters::Subscriber<nav_msgs::Odometry> odom_sub(nh, "/deepracer1/base_pose_ground_truth", 1);

    typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::PointCloud2, msgs::MsgCamera, nav_msgs::Odometry> SyncPolicy;
    message_filters::Synchronizer<SyncPolicy> sync(SyncPolicy(1), pcd_sub, img_sub, odom_sub);
    sync.registerCallback(boost::bind(&writter, _1, _2, _3));
    ros::spin();

    return 0;
}
 