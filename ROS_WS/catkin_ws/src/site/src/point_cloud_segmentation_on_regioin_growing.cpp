/* 基于区域生长算法的聚类 */

#include <iostream>
#include <vector>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/search/search.h>
#include <pcl/search/kdtree.h>
#include <pcl/features/normal_3d.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/filters/passthrough.h>
#include <pcl/segmentation/region_growing.h>

int main(int argc, char** argv)
{
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>); // new点云指针
    if (pcl::io::loadPCDFile <pcl::PointXYZ>("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud_segmented_on_RANSAC.pcd", *cloud) >= 0)
    {std::cerr << "point_cloud_segmented_on_RANSAC.pcd" << " " << cloud->points.size() << "points have been loaded" << std::endl;}

    pcl::search::Search<pcl::PointXYZ>::Ptr tree = boost::shared_ptr<pcl::search::Search<pcl::PointXYZ> >(new pcl::search::KdTree<pcl::PointXYZ>); //创建一个指向kd树搜索对象的共享指针
    pcl::PointCloud <pcl::Normal>::Ptr normals(new pcl::PointCloud <pcl::Normal>);

    pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimator; // 创建法线估计对象
    normal_estimator.setSearchMethod(tree); // 设置搜索方法
    normal_estimator.setInputCloud(cloud); // 设置法线估计对象输入点集
    normal_estimator.setKSearch(100); // 设置用于法向量估计的k近邻数目 100时效果较好
    normal_estimator.compute(*normals); // 计算并输出法向量

    // 区域生长点云分割类
    pcl::RegionGrowing<pcl::PointXYZ, pcl::Normal> reg;

    // 设定每个类中最少点数
    reg.setMinClusterSize(90); // 90时效果较好
    reg.setMaxClusterSize(10000);
    reg.setSearchMethod(tree);
    // 设置邻域的数量
    reg.setNumberOfNeighbours(50);
    reg.setInputCloud(cloud);
    reg.setInputNormals(normals); // 输入法向量

    // 设置平滑阈值大小
    reg.setSmoothnessThreshold(3.0 / 180.0 * M_PI);
    // 设置曲率阈值
    reg.setCurvatureThreshold(1.0);

    std::vector <pcl::PointIndices> clusters;
    reg.extract(clusters); // 获取聚类的结果，分割结果保存在点云索引的向量中

    std::cout << "Number of clusters is equal to " << clusters.size() << std::endl;
    std::cout << "First cluster has " << clusters[0].indices.size() << " points." << endl;

    // 如果点云成功分割，返回彩色点云，否则返回为空
    pcl::PointCloud <pcl::PointXYZRGB>::Ptr colored_cloud = reg.getColoredCloud();
    if (colored_cloud->empty())
    {
        std::cout << "Segmentation on region growing failed" << std::endl;
        return -1;
    }
    else
    {
        pcl::io::savePCDFile("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud_segmented_on_region_growing.pcd", *colored_cloud);
        pcl::visualization::CloudViewer viewer ("point_cloud_segmented_on_region_growing");
        viewer.showCloud(colored_cloud);
        while (!viewer.wasStopped ()){}
    }
    return 0;
}