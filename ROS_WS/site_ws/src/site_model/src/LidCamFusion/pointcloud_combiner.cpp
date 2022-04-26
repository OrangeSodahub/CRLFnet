/*###########################################################
#   This py file subscribe the topic of lidars and publish  #
#   the integrated information.                             #
###########################################################*/

#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
// self_defined pointcloud_list
#include <pointcloud_msgs/MsgObject.h>
#include <pointcloud_msgs/MsgPointCloud.h>
using namespace std;

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

void pointcloud_combiner(const pointcloud_msgs::MsgPointCloud& pointcloud_list)
{
    
    // Transform cloud from type sensor_msgs::PointCloud2 to pcl::PointCloud
    PointCloudT cloud11_pcl, cloud12_pcl, cloud2_pcl;
    pcl::fromROSMsg(pointcloud_list.pointcloud[0], cloud11_pcl);
    pcl::fromROSMsg(cloud12, cloud12_pcl);
    pcl::fromROSMsg(cloud2, cloud2_pcl);

    // Fix locations
    for(int i=0;i<cloud2_pcl.points.size();i++)
    {
        // cloud11
        if(i<cloud11_pcl.points.size())
        {
            cloud11_pcl.points[i].x += lidar11_x;
            cloud11_pcl.points[i].y += lidar11_y;
            cloud11_pcl.points[i].z += lidar11_z;
        }
        // cloud12
        if(i<cloud12_pcl.points.size())
        {
            cloud12_pcl.points[i].x += lidar12_x;
            cloud12_pcl.points[i].y += lidar12_y;
            cloud12_pcl.points[i].z += lidar12_z;
        }
        cloud2_pcl.points[i].x += lidar2_x;
        cloud2_pcl.points[i].y += lidar2_y;
        cloud2_pcl.points[i].z += lidar2_z;
    }

    // Combine
    PointCloudT cloud = cloud11_pcl + cloud12_pcl + cloud2_pcl;

    // Publish
    ros::NodeHandle nh_pub;
    ros::Publisher pub = nh_pub.advertise<PointCloud2>("/point_cloud_combined", 1);
    PointCloud2 output;
    pcl::toROSMsg(cloud, output);
    output.header.frame_id = "point_cloud";
    output.header.stamp = ros::Time::now();
    pub.publish(output);
    cout << "Point Cloud Combined." << endl;
}

int main (int argc, char **argv)
{
    ros::init (argc, argv, "point_cloud_listener");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/pointcloud_list", 1, pointcloud_combiner); // //velodyne11_points

    ros::spin();

    return 0;
}
