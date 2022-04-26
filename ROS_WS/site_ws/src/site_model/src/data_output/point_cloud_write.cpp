#include <ros/ros.h>
//msgs type and conversion
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
//pcd io
#include <pcl/io/pcd_io.h>
//point types
#include <pcl/point_types.h>
 
int i = 1;
void cloudCB1(const sensor_msgs::PointCloud2 &input)
{
    std::string num = std::to_string(i);
    pcl::PointCloud<pcl::PointXYZI> cloud; // 点云数据格式为PointXYZ
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/1/point_cloud1_"+num+".pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud1.pcd_" << num << " " << cloud.points.size() << "points have been written" << std::endl;}
}

void cloudCB2(const sensor_msgs::PointCloud2 &input)
{
    std::string num = std::to_string(i);
    pcl::PointCloud<pcl::PointXYZI> cloud;
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/2/point_cloud2_"+num+".pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud2.pcd_" << num << " " << cloud.points.size() << "points have been written" << std::endl;}
}

void cloudCB3(const sensor_msgs::PointCloud2 &input)
{
    std::string num = std::to_string(i);
    pcl::PointCloud<pcl::PointXYZI> cloud;
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/3/point_cloud3_"+num+".pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud3.pcd_" << num << " " << cloud.points.size() << "points have been written" << std::endl;}

    i ++;
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_write");
    ros::NodeHandle nh;

    ros::Subscriber bat_sub1 = nh.subscribe("/velodyne1_points", 2000, cloudCB1); // //velodyne11_points
    ros::Subscriber bat_sub2 = nh.subscribe("/velodyne2_points", 2000, cloudCB2); // //velodyne12_points
    ros::Subscriber bat_sub3 = nh.subscribe("/velodyne3_points", 2000, cloudCB3); // //velodyne2_points
    ros::spin();

    return 0;
}
 