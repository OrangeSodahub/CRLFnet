/*###########################################################
#   This cpp file subscribe the topic of camera_info        #        
#   according to the sequence or 10 cameras and save        #        
#   their D/K/R/P matrix to txt files                       #
#   Author: Yangxiuyu                                       #
############################################################*/

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sensor_msgs/CameraInfo.h>
#include <vector>
#include <fstream>
#include <iostream>
#include <time.h>
#include <string>
#include <array>

using namespace std;

void CamCB11(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera11 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout;
    fout.open(filename.c_str());
    fout << "11" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB12(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera12 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "12" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB13(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera13 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "13" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB14(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera14 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "14" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB2(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera2 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "2" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB3(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera3 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "3" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB41(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera41 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "41" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB42(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera42 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "42" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB43(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera43 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "43" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();
}

void CamCB44(const sensor_msgs::CameraInfo &CamInfo)
{
	std::cerr << "Get camera44 Successfully!" << std::endl;
	ros::NodeHandle nh; 
	
    // Set the file name
    string filename="/home/zonlin/CRLFnet/src/site_model/src/camera_info/camera_info.txt";

    // Get the K&P matrix
    vector<double> D = CamInfo.D;
    boost::array<double,9> K = CamInfo.K;
    boost::array<double,9> R = CamInfo.R;
    boost::array<double,12> P = CamInfo.P;

    // Save data to txt files
    ofstream fout(filename,ios::app);
    fout << endl;
    fout << "44" << " ";
    for(int i=0;i<9;i++)
    {
        fout << D[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << K[i] << " ";
    }
    for(int i=0;i<9;i++)
    {
        fout << R[i] << " ";
    }
    for(int i=0;i<12;i++)
    {
        fout << P[i] << " ";
    }
    fout<<flush;
    fout.close();

    ros::shutdown();
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "get_cam_info");
    ros::NodeHandle nh;
    ros::Subscriber sub11 = nh.subscribe("/camera11/camera_info", 1, CamCB11);
    ros::Subscriber sub12 = nh.subscribe("/camera12/camera_info", 10, CamCB12);
    ros::Subscriber sub13 = nh.subscribe("/camera13/camera_info", 10, CamCB13);
    ros::Subscriber sub14 = nh.subscribe("/camera14/camera_info", 10, CamCB14);
    ros::Subscriber sub2 = nh.subscribe("/camera2/camera_info", 10, CamCB2);
    ros::Subscriber sub3 = nh.subscribe("/camera3/camera_info", 10, CamCB3);
    ros::Subscriber sub41 = nh.subscribe("/camera41/camera_info", 10, CamCB41);
    ros::Subscriber sub42 = nh.subscribe("/camera42/camera_info", 10, CamCB42);
    ros::Subscriber sub43 = nh.subscribe("/camera43/camera_info", 10, CamCB43);
    ros::Subscriber sub44 = nh.subscribe("/camera44/camera_info", 10, CamCB44);

    ros::spin();
    return 0;
}