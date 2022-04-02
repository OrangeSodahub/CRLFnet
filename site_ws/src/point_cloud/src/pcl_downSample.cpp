/*#include <ros/ros.h>
#include <pcl/visualization/cloud_viewer.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
class cloudHandler
{
public:
    cloudHandler()
    : viewer("Cloud Viewer")
    {
      pcl::PointCloud<pcl::PointXYZ> cloud;
      pcl::PointCloud<pcl::PointXYZ> cloud_filtered;
      pcl::PointCloud<pcl::PointXYZ> cloud_downsampled;
 
      pcl::io::loadPCDFile ("0.pcd", cloud);
 
//剔除离群值
      pcl::StatisticalOutlierRemoval<pcl::PointXYZ> statFilter;
        statFilter.setInputCloud(cloud.makeShared());
        statFilter.setMeanK(10);
        statFilter.setStddevMulThresh(0.2);
        statFilter.filter(cloud_filtered);
//缩减采样
 	pcl::VoxelGrid<pcl::PointXYZ> voxelSampler;//初始化 体素栅格滤波器
        voxelSampler.setInputCloud(cloud_filtered.makeShared());//输入点云
        voxelSampler.setLeafSize(0.01f, 0.01f, 0.01f);//每个体素的长宽高0.01m
        voxelSampler.filter(cloud_downsampled);//输出点云结果
 
     viewer.showCloud(cloud_downsampled.makeShared());
 
     viewer_timer = nh.createTimer(ros::Duration(0.1), &cloudHandler::timerCB, this);
    }*/