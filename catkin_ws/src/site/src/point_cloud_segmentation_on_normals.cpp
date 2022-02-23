//该算法（区域生长分割）同欧式聚类分割类似，也是最后将聚类分割的结果存放至一个点云索引的向量vector中
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
#include <pcl/console/print.h>
#include <pcl/console/parse.h>
#include <pcl/console/time.h>
//#include <windows.h>
#include <stdio.h>
//#include <psapi.h>
/***
void PrintMemoryInfo( )
{
    HANDLE hProcess;
    PROCESS_MEMORY_COUNTERS pmc;
	hProcess=GetCurrentProcess();
    printf( "\nProcess ID: %u\n", hProcess );
    // Print information about the memory usage of the process.
	//输出进程使用的内存信息
   
    if (NULL == hProcess)
        return;
    if ( GetProcessMemoryInfo( hProcess, &pmc, sizeof(pmc)) )
    {
        printf( "\tPageFaultCount: 0x%08X\n", pmc.PageFaultCount );
        printf( "\tPeakWorkingSetSize: 0x%08X\n", 
                  pmc.PeakWorkingSetSize );
        printf( "\tWorkingSetSize: 0x%08X\n", pmc.WorkingSetSize );
        printf( "\tQuotaPeakPagedPoolUsage: 0x%08X\n", 
                  pmc.QuotaPeakPagedPoolUsage );
        printf( "\tQuotaPagedPoolUsage: 0x%08X\n", 
                  pmc.QuotaPagedPoolUsage );
        printf( "\tQuotaPeakNonPagedPoolUsage: 0x%08X\n", 
                  pmc.QuotaPeakNonPagedPoolUsage );
        printf( "\tQuotaNonPagedPoolUsage: 0x%08X\n", 
                  pmc.QuotaNonPagedPoolUsage );
        printf( "\tPagefileUsage: 0x%08X\n", pmc.PagefileUsage ); 
        printf( "\tPeakPagefileUsage: 0x%08X\n", 
                  pmc.PeakPagefileUsage );
    }
    CloseHandle( hProcess );
}
****/
using namespace pcl::console;
int
main (int argc, char** argv)
{
 
	if(argc<2)
	{
		std::cout<<".exe xx.pcd -kn 50 -bc 0 -fc 10.0 -nc 0 -st 30 -ct 0.05"<<endl;
 
		return 0;
	}//如果输入参数小于1个，输出提示
	time_t start,end,diff[5],option;//定义几个时刻，便于后面作差输出每一步花费的时间
	start = time(0); 
	int KN_normal=50; //设置默认输入参数
	bool Bool_Cuting=false;//设置默认输入参数
	float far_cuting=10,near_cuting=0,SmoothnessThreshold=30.0,CurvatureThreshold=0.05;//设置默认输入参数
	parse_argument (argc, argv, "-kn", KN_normal);//设置用于法向量估计的k近邻数目
	parse_argument (argc, argv, "-bc", Bool_Cuting);//设置是否需要直通滤波
	parse_argument (argc, argv, "-fc", far_cuting);//直通滤波的最大值
	parse_argument (argc, argv, "-nc", near_cuting);//直通滤波的最小值
	parse_argument (argc, argv, "-st", SmoothnessThreshold);//平滑阈值
	parse_argument (argc, argv, "-ct", CurvatureThreshold);//曲率阈值
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
	if ( pcl::io::loadPCDFile <pcl::PointXYZ> (argv[1], *cloud) == -1)
	{
		std::cout << "Cloud reading failed." << std::endl;
		return (-1);
	}// 加载输入点云数据
	end = time(0); 
	diff[0] = difftime (end, start); 
	PCL_INFO ("\tLoading pcd file takes(seconds): %d\n", diff[0]);
	//Noraml estimation step(1 parameter)
	//创建一个tree对象
	pcl::search::Search<pcl::PointXYZ>::Ptr tree = boost::shared_ptr<pcl::search::Search<pcl::PointXYZ> > (new pcl::search::KdTree<pcl::PointXYZ>);//创建一个指向kd树搜索对象的共享指针
	pcl::PointCloud <pcl::Normal>::Ptr normals (new pcl::PointCloud <pcl::Normal>);
	pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimator;//创建法线估计对象
	normal_estimator.setSearchMethod (tree);//设置搜索方法
	normal_estimator.setInputCloud (cloud);//设置法线估计对象输入点集
	normal_estimator.setKSearch (KN_normal);// 设置用于法向量估计的k近邻数目
	normal_estimator.compute (*normals);//计算并输出法向量
	end = time(0); 
	diff[1] = difftime (end, start)-diff[0]; 
	PCL_INFO ("\tEstimating normal takes(seconds): %d\n", diff[1]);//输出法线估计这一步用了多久时间
	//optional step: cutting the part are far from the orignal point in Z direction.2 parameters
	pcl::IndicesPtr indices (new std::vector <int>);//创建一组索引
	if(Bool_Cuting)//判断是否需要直通滤波
	{
 
		pcl::PassThrough<pcl::PointXYZ> pass;//设置直通滤波器对象
		pass.setInputCloud (cloud);//设置输入点云
		pass.setFilterFieldName ("z");//设置指定过滤的维度
		pass.setFilterLimits (near_cuting, far_cuting);//设置指定纬度过滤的范围
		pass.filter (*indices);//执行滤波，保存滤波结果在上述索引中
	}
 
 
	// 区域生长算法的5个参数
	pcl::RegionGrowing<pcl::PointXYZ, pcl::Normal> reg;//创建区域生长分割对象
	reg.setMinClusterSize (50);//设置一个聚类需要的最小点数
	reg.setMaxClusterSize (1000000);//设置一个聚类需要的最大点数
	reg.setSearchMethod (tree);//设置搜索方法
	reg.setNumberOfNeighbours (30);//设置搜索的临近点数目
	reg.setInputCloud (cloud);//设置输入点云
	if(Bool_Cuting)reg.setIndices (indices);//通过输入参数设置，确定是否输入点云索引.如果需要直通滤波，就设置输入点云的索引
	reg.setInputNormals (normals);//设置输入点云的法向量
	reg.setSmoothnessThreshold (SmoothnessThreshold / 180.0 * M_PI);//设置平滑阈值
	reg.setCurvatureThreshold (CurvatureThreshold);//设置曲率阈值
 
	std::vector <pcl::PointIndices> clusters;//保存每一种聚类，每一种聚类下面还有具体的点
	reg.extract (clusters);//获取聚类的结果，分割结果保存在点云索引的向量中。
	end = time(0); 
	diff[2] = difftime (end, start)-diff[0]-diff[1]; //区域生长分割算法花费的时间
	PCL_INFO ("\tRegion growing takes(seconds): %d\n", diff[2]);
 
	std::cout << "Number of clusters is equal to " << clusters.size () << std::endl;//输出聚类的数量，有几类
	std::cout << "First cluster has " << clusters[0].indices.size () << " points." << endl;//输出第一个聚类中点的数量
	/***
	std::cout << "These are the indices of the points of the initial" <<
		std::endl << "cloud that belong to the first cluster:" << std::endl;
	int counter = 0;
	while (counter < clusters[0].indices.size ())
	{
	std::cout << clusters[0].indices[counter] << ", ";
	counter++;
	if (counter % 10 == 0)
	std::cout << std::endl;
	}
	std::cout << std::endl;
	 ***/
 
	//保存第一个分割
	//vector和迭代器 理解不到位
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_seg1(new pcl::PointCloud<pcl::PointXYZ>);
	for (std::vector<int>::const_iterator pit = clusters[0].indices.begin();pit !=clusters[0].indices.end();pit++)//创建一个迭代器pit以访问第一个聚类的每一个点
    {
        cloud_seg1->points.push_back(cloud->points[*pit]);//迭代器pit类似于一个指针，将第一个聚类分割中的每一个点进行强制类型转换，并放置在points中
    }
	cloud_seg1->width = cloud_seg1->points.size();
	cloud_seg1->height = 1;
	cloud_seg1->is_dense = false;
	pcl::io::savePCDFileASCII("cloud_seg1.pcd",*cloud_seg1);
	std::cerr<<"cloud_seg1 saved!!!  poins: "<<cloud_seg1->size()<<std::endl;
 
/**
	//保存分割结果----------------------------------------------------------------------------------------------------------------------------------
    int j = 0;
    for (std::vector<pcl::PointIndices>::const_iterator it = clusters.begin (); it != clusters.end (); ++it)
    {
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster(new pcl::PointCloud<pcl::PointXYZ>);
        //创建新的点云数据集cloud_cluster，直到分割出所有聚类
        for (std::vector<int>::const_iterator pit = it->indices.begin(); pit != it->indices.end(); pit++)
            cloud_cluster->points.push_back(cloud_seg1->points[*pit]);
        cloud_cluster->width = cloud_cluster->points.size();
        cloud_cluster->height = 1;
        cloud_cluster->is_dense = true;
        std::cout << "PointCloud representing the Cluster: " << cloud_cluster->points.size() << " data points."
                  << std::endl;
        std::stringstream ss;
        ss << "cloud_cluster_" << j << ".pcd";
        pcl::io::savePCDFileASCII(ss.str(),*cloud_cluster);
        j++;
    }
**/
 
	//PrintMemoryInfo();
	pcl::PointCloud <pcl::PointXYZRGB>::Ptr colored_cloud = reg.getColoredCloud ();//如果点云分割成功，该函数返回有色点云，相同的分割有相同的颜色，但是该函数不保证不同的分割一定会有不同的颜色，即不同的分割也可能会有相同的颜色
	pcl::visualization::CloudViewer viewer ("点云库PCL学习教程第二版-区域增长分割方法");
	viewer.showCloud(colored_cloud);
	while (!viewer.wasStopped ())
	{
	}//进行可视化
 
	return (0);
}