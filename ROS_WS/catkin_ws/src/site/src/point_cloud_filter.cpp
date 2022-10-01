#include <iostream>
#include <ros/ros.h>
#include <pcl/visualization/cloud_viewer.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/filters/voxel_grid.h>

class cloudHandler
{
public:
    cloudHandler():viewer("Cloud Viewer")
    {
        pcl::PointCloud<pcl::PointXYZ> cloud; // 原始点云
        pcl::PointCloud<pcl::PointXYZ> cloud_filtered; // 经过滤波后的点云
        pcl::PointCloud<pcl::PointXYZ> cloud_downsampled; // 经过下采样后的点云
        pcl::io::loadPCDFile ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud.pcd", cloud);
        std::cerr << "point_cloud.pcd" << " " << cloud.points.size() << "points have been loaded" << std::endl;
 
        //剔除离群值
        pcl::StatisticalOutlierRemoval<pcl::PointXYZ> statFilter; // 统计离群值算法
        statFilter.setInputCloud(cloud.makeShared()); // 输入点云
        statFilter.setMeanK(10); // 均值滤波
        statFilter.setStddevMulThresh(0.05); // 方差0.05
        statFilter.filter(cloud_filtered); // 输出结果到点云

        //缩减采样
        pcl::VoxelGrid<pcl::PointXYZ> voxelSampler; // 初始化 体素栅格滤波器
        voxelSampler.setInputCloud(cloud_filtered.makeShared()); // 输入点云
        voxelSampler.setLeafSize(0.005f, 0.005f, 0.005f); // 每个体素的长宽高0.01m
        voxelSampler.filter(cloud_downsampled); // 输出点云结果

        //保存点云文件
        if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud_filtered_downsampled.pcd", cloud_downsampled)>=0)
        {std::cerr << "Saved point_cloud_filtered_downsampled.pcd" << " " << cloud_downsampled.points.size() << "points have been written" << std::endl;}
 
        viewer.showCloud(cloud_filtered.makeShared());
        viewer_timer = nh.createTimer(ros::Duration(0.1), &cloudHandler::timerCB, this);
    }
 
    void timerCB(const ros::TimerEvent&)
    {
        if (viewer.wasStopped())
        {
            ros::shutdown();
        }
    }
 
protected:
    ros::NodeHandle nh;
    
    pcl::visualization::CloudViewer viewer;
    ros::Timer viewer_timer;
};
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_filter"); // node
    cloudHandler handler;
    ros::spin();
    return 0;
}