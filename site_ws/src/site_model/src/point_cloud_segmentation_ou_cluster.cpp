/* 欧式聚类分割 */

#include <pcl/ModelCoefficients.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/normal_3d.h>
#include <pcl/kdtree/kdtree.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/visualization/pcl_visualizer.h>//可视化相关头文件
 
int main (int argc, char** argv)
{
    // Read in the cloud data
    pcl::PCDReader reader;
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloud_f (new pcl::PointCloud<pcl::PointXYZ>);
    reader.read ("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/point_cloud.pcd", *cloud); // cloud已经过滤波和降采样
    
    // Create the segmentation object for the planar model and set all the parameters
    pcl::SACSegmentation<pcl::PointXYZ> seg;//实例化一个分割对象
    pcl::PointIndices::Ptr inliers (new pcl::PointIndices);//实例化一个索引
    pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);//实例化模型参数
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_plane (new pcl::PointCloud<pcl::PointXYZ> ());//提取到的平面保存至cloud_plane
    pcl::PCDWriter writer;
    seg.setOptimizeCoefficients (true);//参数优化
    seg.setModelType (pcl::SACMODEL_PLANE);//模型类型：平面
    seg.setMethodType (pcl::SAC_RANSAC);//参数估计方法
    seg.setMaxIterations (100);//最大迭代次数
    seg.setDistanceThreshold (0.02);//设置内点到模型的距离允许最大值
    
    int i=0, nr_points = (int) cloud->points.size ();//计数变量i，记下提取的平面的个数
    while (cloud->points.size () > 0.3 * nr_points) //***该循环不断地去除平面
    {
    
        // Segment the largest planar component from the remaining cloud
        seg.setInputCloud (cloud);//设置要分割的点云
        seg.segment (*inliers, *coefficients);//输出平面点的索引和参数
        if (inliers->indices.size () == 0)//如果平面点索引的数量为0
        {
        std::cout << "Could not estimate a planar model for the given dataset." << std::endl;
        break;
        }
    
    
        // Extract the planar inliers from the input cloud
        pcl::ExtractIndices<pcl::PointXYZ> extract;//实例化一个提取对象
        extract.setInputCloud (cloud);//设置要提取的点云
        extract.setIndices (inliers);//根据分割得到的平面的索引提取平面
        extract.setNegative (false);//提取内点
    
        // Write the planar inliers to disk
        extract.filter (*cloud_plane);//保存提取到的平面到cloud_plane
        std::cout << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
    
        //存写指针的参数
        cloud_plane->width = cloud_plane->points.size();
        cloud_plane->height = 1;
        cloud_plane->resize(cloud_plane->width);
        cloud_plane->is_dense = false;
        //依次将该指针(cloud_plane)保存至一个专门存放平面的文件(未设置点云格式）、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
        std::stringstream s_plane;
        s_plane << "cloud_plane_"<< i <<".pcd";
        pcl::io::savePCDFileASCII("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/"+s_plane.str(),*cloud_plane); //2022.2.23设置了保存路径
        std::cout<<s_plane.str()<<" save successfully \n\n"<<std::endl;
    
        //计数变量加1
        i++;
        // Remove the planar inliers, extract the rest
        extract.setNegative (true);//提取外点（除第一个平面之外的点） //2022.2.23如果是false则提取的是内点
        extract.filter (*cloud_f);//保存除平面之外的剩余点
        cloud = cloud_f;//将剩余点作为下一次分割、提取的平面的输入点云
    }
    
    // Creating the KdTree object for the search method of the extraction
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ>);
    tree->setInputCloud (cloud);//将无法提取平面的点云作为cloud
    
    std::vector<pcl::PointIndices> cluster_indices;//保存每一种聚类，每一种聚类下还有具体的聚类的点
    pcl::EuclideanClusterExtraction<pcl::PointXYZ> ec;//实例化一个欧式聚类提取对象
    ec.setClusterTolerance (0.02); // 近邻搜索的搜索半径为2cm，重要参数
    ec.setMinClusterSize (100);//设置一个聚类需要的最少点数目为100
    ec.setMaxClusterSize (25000);//一个聚类最大点数目为25000
    ec.setSearchMethod (tree);//设置点云的搜索机制
    ec.setInputCloud (cloud);//设置输入点云
    ec.extract (cluster_indices);//将聚类结果保存至cluster_indices中
    
    //迭代访问点云索引cluster_indices，直到分割出所有聚类,一个循环提取出一类点云
    int j = 0;
    for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it)
    {
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster (new pcl::PointCloud<pcl::PointXYZ>);
        //创建新的点云数据集cloud_cluster，直到分割出所有聚类
        for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); pit++)
        cloud_cluster->points.push_back (cloud->points[*pit]); //*
        cloud_cluster->width = cloud_cluster->points.size ();
        cloud_cluster->height = 1;
        cloud_cluster->is_dense = true;
    
        std::cout << "PointCloud representing the Cluster: " << cloud_cluster->points.size () << " data points." << std::endl;
        std::stringstream ss;
        ss << "cloud_cluster_" << j << ".pcd";
        writer.write<pcl::PointXYZ> ("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/"+ss.str (), *cloud_cluster); //*
        j++;
    }
    
    pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer("point_cloud viewer"));
    int v1(0);
    viewer->createViewPort(0,0,0.5,1,v1);
    viewer->setBackgroundColor(0,0,0,v1);
    viewer->addPointCloud(cloud,"cloud",v1);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,255,255,255,"cloud",v1);
    
    //第二个视口，显示分割聚类后的点云
    //读入每一个点云
    pcl::PointCloud<pcl::PointXYZ>::Ptr view0(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr view1(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr view2(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr view3(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr view4(new pcl::PointCloud<pcl::PointXYZ>);
    //读取两个平面的指针
    pcl::PointCloud<pcl::PointXYZ>::Ptr view_plane1(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr view_plane2(new pcl::PointCloud<pcl::PointXYZ>);
    
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_cluster_0.pcd",*view0);
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_cluster_1.pcd",*view1);
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_cluster_2.pcd",*view2);
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_cluster_3.pcd",*view3);
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_cluster_4.pcd",*view4);
    //读取两个平面
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_plane_0.pcd",*view_plane1);
    pcl::io::loadPCDFile("/home/zonlin/ROS/site_ws/src/site_model/point_cloud_data/cloud_plane_1.pcd",*view_plane2);
    std::cerr<<"cloud_plane read"<<std::endl;

    int v2(0);
    viewer->createViewPort(0.5,0,1,1,v2);
    viewer->setBackgroundColor(1,1,1,v2);

    viewer->addPointCloud(view0,"view0",v2);
    viewer->addPointCloud(view1,"view1",v2);
    viewer->addPointCloud(view2,"view2",v2);
    viewer->addPointCloud(view3,"view3",v2);
    viewer->addPointCloud(view4,"view4",v2);

    //显示两个平面
    viewer->addPointCloud<pcl::PointXYZ>(view_plane1,"view_plane1",v2);
    viewer->addPointCloud(view_plane2,"view_plane2",v2);
    std::cout<<"added!"<<std::endl;

    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,255,0,0,"view0",v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,0,255,0,"view1",v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,0,0,255,"view2",v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,126,123,0,"view3",v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,0,0,0,"view4",v2);

    //设置两个平面的颜色
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,100,0,60,"view_plane1",v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR,0,255,60,"view_plane2",v2);
    
    while (!viewer->wasStopped())
    {
        viewer->spinOnce();
    }
    return (0);
    }