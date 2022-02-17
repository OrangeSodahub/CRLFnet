#include <ros/ros.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/io/pcd_io.h>
 
void cloudCB(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZ> cloud; // 点云数据格式为PointXYZ
    pcl::fromROSMsg(input, cloud);
    pcl::io::savePCDFileASCII ("/home/zonlin/ROS/neor_mini/mini_sim18_ws/src/point_cloud/data/test_pcd.pcd", cloud);
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "pcl_write");
    ros::NodeHandle nh;
    ros::Subscriber bat_sub = nh.subscribe("pcl_output", 10, cloudCB); // topic名为pcl_output
    ros::spin();
 
    return 0;
}