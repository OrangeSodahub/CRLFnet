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
 
void cloudCB1(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZI> cloud; // 点云数据格式为PointXYZ
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/point_cloud1.pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud1.pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
}

void cloudCB2(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZI> cloud;
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/point_cloud2.pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud2.pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
}

void cloudCB3(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZI> cloud;
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/point_cloud3.pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud3.pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_write");
    ros::NodeHandle nh;
    int i=1;
    ros::Subscriber bat_sub1 = nh.subscribe("/velodyne1_points", 10, cloudCB1); // //velodyne11_points
    ros::Subscriber bat_sub2 = nh.subscribe("/velodyne2_points", 10, cloudCB2); // //velodyne12_points
    ros::Subscriber bat_sub3 = nh.subscribe("/velodyne3_points", 10, cloudCB3); // //velodyne2_points
 
    ros::spin();
    return 0;
}
 