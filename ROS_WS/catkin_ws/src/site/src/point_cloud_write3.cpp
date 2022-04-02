#include <ros/ros.h>
#include <pcl/point_cloud.h>
//msgs type and conversion
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
//pcd io
#include <pcl/io/pcd_io.h>
//point types
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_types.h>
 
void cloudCB(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZI> cloud; // 点云数据格式为PointXYZ
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud3.pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud3.pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_write3");
    ros::NodeHandle nh;
    ros::Subscriber bat_sub = nh.subscribe("/velodyne3_points", 10, cloudCB); // /velodyne2_points
    ros::spin();
 
    return 0;
}