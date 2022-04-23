#include <pcl/io/pcd_io.h>

using namespace std;

typedef pcl::PointXYZI PointT; // 注意点云格式是：XYZ还是XYZRGB,XYZI
typedef pcl::PointCloud<PointT> PointCloudT;

int main()
{
	PointCloudT::Ptr cloud_1(new PointCloudT);
	PointCloudT::Ptr cloud_2(new PointCloudT);
	PointCloudT::Ptr cloud_3(new PointCloudT);
	PointCloudT::Ptr cloud(new PointCloudT);
	int i = 1;
	for(;i<1707;i++)
	{
		std::string num = std::to_string(i);
		pcl::io::loadPCDFile("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/1/point_cloud1_"+num+".pcd", *cloud_1);
		pcl::io::loadPCDFile("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/2/point_cloud2_"+num+".pcd", *cloud_2);
		pcl::io::loadPCDFile("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/initial/3/point_cloud3_"+num+".pcd", *cloud_3);

		*cloud = *cloud_1 + *cloud_2 + *cloud_3;

		if(pcl::io::savePCDFileASCII ("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/point_cloud_"+num+".pcd", *cloud)>=0)
		{std::cerr << "Saved point_cloud_"+num+".pcd" << " " << cloud->points.size() << "points have been merged" << std::endl;}
	}
	std::cerr << "Done." << std::endl;

	return 0;
}