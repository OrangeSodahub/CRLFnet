/* 随机一致性算法 去除地面点 */

#include <ros/ros.h>
#include <pcl/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/visualization/cloud_viewer.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
 
int main(int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_segmentation"); // node
    ros::NodeHandle nh;
    //初始化
    pcl::PointCloud<pcl::PointXYZ> cloud; // 原始数据(已滤波及降采样)
    pcl::PointCloud<pcl::PointXYZ> cloud_segmented; // 点云分割后数据

    ros::Publisher ind_pub = nh.advertise<pcl_msgs::PointIndices>("point_indices", 1);
    ros::Publisher coef_pub = nh.advertise<pcl_msgs::ModelCoefficients>("planar_coef", 1);

    pcl::io::loadPCDFile ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud_filtered_downsampled.pcd", cloud);
    std::cerr << "point_cloud_segmented.pcd:" << " " << cloud_segmented.points.size() << "points have been loaded" << std::endl;

    //RANSAC算法 分割
	pcl::ModelCoefficients coefficients;//初始化模型系数
    pcl::PointIndices::Ptr inliers(new pcl::PointIndices());//初始化索引参数
    pcl::SACSegmentation<pcl::PointXYZ> segmentation;//创建算法
    segmentation.setModelType(pcl::SACMODEL_PLANE);//设置分割模型为平面模型
    segmentation.setMethodType(pcl::SAC_RANSAC);//设置迭代算法
    segmentation.setMaxIterations(1000);//设置最大迭代次数
    segmentation.setDistanceThreshold(0.01);//设置到模型的最大距离
    segmentation.setInputCloud(cloud.makeShared());//输入点云(已经过滤波和降采样)
    segmentation.segment(*inliers, coefficients);//输出点云结果  ×inliers是结果点云的索引，coe是模型系数

    //发布模型系数
    pcl_msgs::ModelCoefficients ros_coefficients;
    pcl_conversions::fromPCL(coefficients, ros_coefficients);//pcl->msg
        
    //发布抽样的内点索引
    pcl_msgs::PointIndices ros_inliers;
    pcl_conversions::fromPCL(*inliers, ros_inliers);

    //创建分割点云，从点云中提取内点
    pcl::ExtractIndices<pcl::PointXYZ> extract;
    extract.setInputCloud(cloud.makeShared());
    extract.setIndices(inliers);
    extract.setNegative(true); // 注意false和true的区别
    extract.filter(cloud_segmented);

    //保存点云文件
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud_segmented.pcd", cloud_segmented)>=0)
    {std::cerr << "Saved point_cloud_segmented.pcd" << " " << cloud_segmented.points.size() << "points have been written" << std::endl;}
     
    ros::Rate loop_rate(1);
    while (ros::ok())
    {
        ind_pub.publish(ros_inliers);
        coef_pub.publish(ros_coefficients); // 发布
        ros::spinOnce();
        loop_rate.sleep();
    }
 
    return 0;
}

/*
main(int argc, char **argv)
{
    ros::init (argc, argv, "pcl_filter");
    ros::NodeHandle nh;
    //初始化
    pcl::PointCloud<pcl::PointXYZ> cloud;
    pcl::PointCloud<pcl::PointXYZ> cloud_filtered;
    pcl::PointCloud<pcl::PointXYZ> cloud_downsampled;
    pcl::PointCloud<pcl::PointXYZ> cloud_segmented;
    ros::Publisher pcl_pub0 = nh.advertise<sensor_msgs::PointCloud2> ("pcl_cloud", 1);
    ros::Publisher pcl_pub1 = nh.advertise<sensor_msgs::PointCloud2> ("pcl_segment", 1);
    ros::Publisher ind_pub = nh.advertise<pcl_msgs::PointIndices>("point_indices", 1);
    ros::Publisher coef_pub = nh.advertise<pcl_msgs::ModelCoefficients>("planar_coef", 1);
        
    sensor_msgs::PointCloud2 output0;
    sensor_msgs::PointCloud2 output1;
    pcl::io::loadPCDFile ("0.pcd", cloud);
    pcl::toROSMsg(cloud, output0);
    output0.header.frame_id = "odom";

    //剔除离群值
    pcl::StatisticalOutlierRemoval<pcl::PointXYZ> statFilter;
    statFilter.setInputCloud(cloud.makeShared());
    statFilter.setMeanK(10);
    statFilter.setStddevMulThresh(0.2);
    statFilter.filter(cloud_filtered);

    //体素栅格法下采样
 	pcl::VoxelGrid<pcl::PointXYZ> voxelSampler;
    voxelSampler.setInputCloud(cloud_filtered.makeShared());
    voxelSampler.setLeafSize(0.01f, 0.01f, 0.01f);
    voxelSampler.filter(cloud_downsampled);

    //RANSAC算法 分割
	pcl::ModelCoefficients coefficients;//初始化模型系数
    pcl::PointIndices::Ptr inliers(new pcl::PointIndices());//初始化索引参数
    pcl::SACSegmentation<pcl::PointXYZ> segmentation;//创建算法
    segmentation.setModelType(pcl::SACMODEL_PLANE);//设置分割模型为平面模型
    segmentation.setMethodType(pcl::SAC_RANSAC);//设置迭代算法
    segmentation.setMaxIterations(1000);//设置最大迭代次数
    segmentation.setDistanceThreshold(0.01);//设置到模型的最大距离
    segmentation.setInputCloud(cloud_downsampled.makeShared());//输入点云
    segmentation.segment(*inliers, coefficients);//输出点云结果  ×inliers是结果点云的索引，coe是模型系数

    //发布模型系数
    pcl_msgs::ModelCoefficients ros_coefficients;
    pcl_conversions::fromPCL(coefficients, ros_coefficients);//pcl->msg
        
    //发布抽样的内点索引
    pcl_msgs::PointIndices ros_inliers;
    pcl_conversions::fromPCL(*inliers, ros_inliers);
        
 
    //创建分割点云，从点云中提取内点
    pcl::ExtractIndices<pcl::PointXYZ> extract;
    extract.setInputCloud(cloud_downsampled.makeShared());
    extract.setIndices(inliers);
    extract.setNegative(false);
    extract.filter(cloud_segmented);
    pcl::toROSMsg(cloud_segmented, output1);
    output1.header.frame_id = "odom";
 
    ros::Rate loop_rate(1);
    while (ros::ok())
    {
        pcl_pub0.publish(output0);
        pcl_pub1.publish(output1);
        
        ind_pub.publish(ros_inliers);
        coef_pub.publish(ros_coefficients);//发布
        ros::spinOnce();
        loop_rate.sleep();
    }
 
    return 0;
}*/