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
 
/*int i=0;
char ch=(char)(int('0'));
void call_back(const sensor_msgs::PointCloud2ConstPtr& input)
{
//Convert the sensor_msgs/PointCloud2 data to pcl/PointCloud
    pcl::PointCloud<pcl::PointXYZ> cloud;
    pcl::fromROSMsg (*input, cloud);//cloud is the output
    
//save to PCD for 5 times    
    std::string pcd_name("point_cloud_2"); //velodyne1
    if(i<5)
    {
        i++;
        ch++;
        pcd_name+=ch;
        if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/catkin_ws/src/site/data/ "+pcd_name+".pcd", cloud)>=0)//input pointcloud should be pcl::PointCloud<PointT> only,rather than others 
        {std::cerr << "Saved  " << pcd_name<<".pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
    }
}
 
int
main(int argc,char** argv)
{
// Initialize ROS
  ros::init (argc, argv, "point_cloud_write2");
  ros::NodeHandle nh;
 
// Create a ROS subscriber for the input point cloud
  ros::Subscriber sub = nh.subscribe ("/velodyne2_points", 1, call_back);
 
// Spin
  ros::spin ();
}*/

 
void cloudCB(const sensor_msgs::PointCloud2 &input)
{
    pcl::PointCloud<pcl::PointXYZ> cloud; // 点云数据格式为PointXYZ
    pcl::fromROSMsg(input, cloud);
    if(pcl::io::savePCDFileASCII ("/home/zonlin/ROS/catkin_ws/src/site/point_cloud_data/point_cloud2.pcd", cloud)>=0)
    {std::cerr << "Saved point_cloud2.pcd" << " " << cloud.points.size() << "points have been written" << std::endl;}
}
 
int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_write2");
    ros::NodeHandle nh;
    ros::Subscriber bat_sub = nh.subscribe("/velodyne2_points", 10, cloudCB); // topic名为/velodyne12_points
    ros::spin();
 
    return 0;
}