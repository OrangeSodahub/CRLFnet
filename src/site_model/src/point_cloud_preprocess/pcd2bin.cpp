#include <ros/ros.h>
#include <iostream>
#include <pcl/io/pcd_io.h>      
#include <pcl/point_types.h>     
using namespace std;

void pcd2bin (string &in_file, string& out_file)
{ 
   //Create a PointCloud value
  pcl::PointCloud<pcl::PointXYZI>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZI>);

  //Open the PCD file
  if (pcl::io::loadPCDFile<pcl::PointXYZI> (in_file, *cloud) == -1) 
  {
    PCL_ERROR ("Couldn't read in_file\n");
  }
  //Create & write .bin file
  ofstream bin_file(out_file.c_str(),ios::out|ios::binary|ios::app);
  if(!bin_file.good()) cout<<"Couldn't open "<<out_file<<endl;  

  //PCD 2 BIN 
  for (size_t i = 0; i < cloud->points.size (); ++i)
  {
    bin_file.write((char*)&cloud->points[i].x,3*sizeof(float)); 
    bin_file.write((char*)&cloud->points[i].intensity,sizeof(float));
  }

  bin_file.close();
}

int main (int argc, char **argv)
{
    ros::init (argc, argv, "pcd2bin");
    ros::NodeHandle nh;

    int i = 0;
    for(;i<30;i++)
    {
      std::string num,
                  zero = to_string(0);
      if(i<10) num = zero + zero + zero + zero + zero + to_string(+i);
      if(i>=10 && i<100) num = zero + zero + zero + zero + to_string(+i);
      if(i>=100 && i<1000) num = zero + zero + zero + to_string(+i);
      if(i>=1000 && i<10000) num = zero + zero + std::to_string(+i);

      string in_file = "/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/filtered/for_test/point_cloud_data_"+to_string(i+1)+".pcd";
      string out_file = "/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/bin/for_test/point_cloud_data_"+to_string(i+1)+".bin";

      pcd2bin(in_file, out_file);
      cout << num + ".pcd converted successfully." << endl;
    }
 
    return 0;
}
