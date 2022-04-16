/*###########################################################
#   This cpp file subscribe the topic of radars and save    #
#	the poses information of vehicles.						#
#   Author: Yangxiuyu                                       #
############################################################*/

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <pcl/point_cloud.h> 
#include <pcl_conversions/pcl_conversions.h> 
#include <sensor_msgs/PointCloud2.h> 
#include <per_msgs/SensorMsgsRadar.h>
#include <per_msgs/GeometryMsgsRadarObject.h>
#include <vector>
#include <fstream>
#include <iostream>
#include <time.h>
#include <string>

using namespace std;

void RadarCB(const per_msgs::SensorMsgsRadar &Radarmsg)
{
    time_t currentTime=time(NULL);
	char chCurrentTime[256];
    

	std::cerr << "Successfully" << std::endl;
	ros::NodeHandle nh; 
	ros::Publisher radar_pub = nh.advertise<sensor_msgs::PointCloud2> ("/radar_show_2", 1);     
	pcl::PointCloud<pcl::PointXYZ> cloud; 
	sensor_msgs::PointCloud2 output; 
	
	// Fill in the cloud data 
	int v_num = Radarmsg.front_left_esr_tracklist.size();
	std::cerr << "left_tracklist_size: " << Radarmsg.front_left_esr_tracklist.size() << std::endl;
	if (v_num!=0)
	{
		// Set the file name
		strftime(chCurrentTime,sizeof(chCurrentTime),"%Y%m%d %H%M%S",localtime(&currentTime));
		string stCurrentTime=chCurrentTime;
		string filename="/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/dataset/radar_data/data"+stCurrentTime+".txt";

		cloud.width = v_num; 
		cloud.height = 1; 
		cloud.points.resize(cloud.width * cloud.height); 

		for(int i=0;i<v_num;i++)
		{
			cloud.points[i].x = Radarmsg.front_left_esr_tracklist[i].obj_vcs_posex;
			cloud.points[i].y = Radarmsg.front_left_esr_tracklist[i].obj_vcs_posey;
			cloud.points[i].z = 2; 
		}

		// Convert the cloud to ROS message 
		pcl::toROSMsg(cloud, output); 
		output.header.frame_id = "/base_link"; 

		// Publish the data
		radar_pub.publish(output);

		// Save data to txt files
		ofstream fout;
		fout.open(filename.c_str());
		int i=0;
		while(i<v_num)
		{
			fout<< i << " " << cloud.points[i].x <<" "<< cloud.points[i].y << endl;
			i++;
		}
		fout<<flush;
		fout.close();
	}
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "radar_listener");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/ARS_408_21_2_Topic", 10, RadarCB);
    ros::spin();
    return 0;
}