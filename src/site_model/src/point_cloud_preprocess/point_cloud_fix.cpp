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

typedef pcl::PointXYZI PointT; // 注意点云格式是：XYZ还是XYZRGB,XYZI
typedef pcl::PointCloud<PointT> PointCloudT;

#define lidar11_x -0.55740706
#define lidar11_y 1.25432157
#define lidar11_z 0.006

#define lidar12_x 0.43254243
#define lidar12_y 0.26437207
#define lidar12_z 0.006

#define lidar2_x 9.74248361e-04
#define lidar2_y -9.89292350e-01
#define lidar2_z 1.91780397e-01

int main()
{
	PointCloudT::Ptr cloud(new PointCloudT);
	int i = 1;
    // 11
	for(;i<31;i++)
	{
		std::string num = std::to_string(i);
		pcl::io::loadPCDFile("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/1/point_cloud1_"+num+".pcd", *cloud);

        for(int j=0;j<cloud->points.size();j++)
        {
            cloud->points[j].x += lidar11_x;
            cloud->points[j].y += lidar11_y;
            cloud->points[j].z += lidar11_z;
        }

		if(pcl::io::savePCDFileASCII ("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/1_fixed/point_cloud1_"+num+".pcd", *cloud)>=0)
		{std::cerr << "Saved point_cloud1_"+num+".pcd" << " " << cloud->points.size() << "points have been fixed." << std::endl;}
	}
    // 12
	for(i=1;i<31;i++)
	{
		std::string num = std::to_string(i);
		pcl::io::loadPCDFile("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/2/point_cloud2_"+num+".pcd", *cloud);

        for(int j=0;j<cloud->points.size();j++)
        {
            cloud->points[j].x += lidar12_x;
            cloud->points[j].y += lidar12_y;
            cloud->points[j].z += lidar12_z;
        }

		if(pcl::io::savePCDFileASCII ("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/2_fixed/point_cloud2_"+num+".pcd", *cloud)>=0)
		{std::cerr << "Saved point_cloud2_"+num+".pcd" << " " << cloud->points.size() << "points have been fixed." << std::endl;}
	}
    // 2
	for(i=1;i<31;i++)
	{
		std::string num = std::to_string(i);
		pcl::io::loadPCDFile("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/3/point_cloud3_"+num+".pcd", *cloud);

        for(int j=0;j<cloud->points.size();j++)
        {
            cloud->points[j].x += lidar2_x;
            cloud->points[j].y += lidar2_y;
            cloud->points[j].z += lidar2_z;
        }

		if(pcl::io::savePCDFileASCII ("/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/for_test/3_fixed/point_cloud3_"+num+".pcd", *cloud)>=0)
		{std::cerr << "Saved point_cloud3_"+num+".pcd" << " " << cloud->points.size() << "points have been fixed." << std::endl;}
	}
	std::cerr << "Done." << std::endl;

	return 0;
}