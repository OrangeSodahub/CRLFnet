/*###########################################################
#   This py file subscribe the topic of lidars and publish  #
#   the integrated information.                             #
###########################################################*/

#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/point_types.h>
#include <msgs/ListPointCloud.h>
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

class pointcloud_combiner
{
private:
    ros::NodeHandle nh;
    ros::Publisher pub;
    ros::Subscriber sub;
public:
    pointcloud_combiner()
    {
        pub = nh.advertise<sensor_msgs::PointCloud2>("/point_cloud_combined", 1);
        sub = nh.subscribe("/pointcloud_list", 1, &pointcloud_combiner::callback, this);
    }
    void callback(const msgs::ListPointCloud& pointcloud_list)
    {
        // define pointcloud type: sensor_msgs::PointCloud2
        sensor_msgs::PointCloud2 cloud11, cloud12, cloud2;
        cloud11 = pointcloud_list.pointcloud[0];
        cloud12 = pointcloud_list.pointcloud[1];
        cloud2 = pointcloud_list.pointcloud[2];
        // Transform cloud from type sensor_msgs::PointCloud2 to pcl::PointCloud
        PointCloudT cloud11_pcl, cloud12_pcl, cloud2_pcl;
        pcl::fromROSMsg(cloud11, cloud11_pcl);
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

        // Combine and remove ground
        PointCloudT cloud = cloud11_pcl + cloud12_pcl + cloud2_pcl;
        PointCloudT cloud_filtered, cloud_segmented;
        //剔除离群值
        pcl::StatisticalOutlierRemoval<pcl::PointXYZI> statFilter;
        statFilter.setInputCloud(cloud.makeShared());
        statFilter.setMeanK(10);
        statFilter.setStddevMulThresh(0.2);
        statFilter.filter(cloud_filtered);

        //RANSAC算法 分割
        pcl::ModelCoefficients coefficients;//初始化模型系数
        pcl::PointIndices::Ptr inliers(new pcl::PointIndices());//初始化索引参数
        pcl::SACSegmentation<pcl::PointXYZI> segmentation;//创建算法
        segmentation.setModelType(pcl::SACMODEL_PLANE);//设置分割模型为平面模型
        segmentation.setMethodType(pcl::SAC_RANSAC);//设置迭代算法
        segmentation.setMaxIterations(1000);//设置最大迭代次数
        segmentation.setDistanceThreshold(0.01);//设置到模型的最大距离
        segmentation.setInputCloud(cloud_filtered.makeShared());//输入点云(已经过滤波和降采样)
        segmentation.segment(*inliers, coefficients);//输出点云结果  ×inliers是结果点云的索引，coe是模型系数

        //发布模型系数
        pcl_msgs::ModelCoefficients ros_coefficients;
        pcl_conversions::fromPCL(coefficients, ros_coefficients);//pcl->msg
            
        //发布抽样的内点索引
        pcl_msgs::PointIndices ros_inliers;
        pcl_conversions::fromPCL(*inliers, ros_inliers);

        //创建分割点云，从点云中提取内点
        pcl::ExtractIndices<pcl::PointXYZI> extract;
        extract.setInputCloud(cloud_filtered.makeShared());
        extract.setIndices(inliers);
        extract.setNegative(true); // 注意false和true的区别
        extract.filter(cloud_segmented);
        cout << "Combined cloud size: " << cloud_segmented.points.size() << endl;

        // Publish
        ros::Publisher pub = nh.advertise<sensor_msgs::PointCloud2>("/point_cloud_combined", 1);
        sensor_msgs::PointCloud2 output;
        pcl::toROSMsg(cloud_segmented, output);
        output.header.frame_id = "point_cloud";
        output.header.stamp = ros::Time::now();
        pub.publish(output);
    }
};

int main (int argc, char **argv)
{
    ros::init (argc, argv, "pointcloud_combiner");
    pointcloud_combiner ptc;

    cout << "Pointcloud Combine Begin." << endl;
    ros::spin();

    return 0;
}
