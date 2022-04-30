#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <iostream>

void imageCallback11(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image11.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image11.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback12(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image12.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image12.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback13(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image13.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image13.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback14(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image14.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image14.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback2(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image2.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image2.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback3(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image3.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image3.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback41(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image41.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image41.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback42(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image42.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image42.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback43(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image43.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image43.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

void imageCallback44(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/camera_data/image44.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image11.jpg" << std::endl;}
   // cv::WaitKey(3);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());  
  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "image_output");
  ros::NodeHandle nh;
  // cv::namedWindow("image2");
  // cv::startWindowThread();
  image_transport::ImageTransport it(nh);
  image_transport::Subscriber sub1 = it.subscribe("/image_raw_11", 1, imageCallback11);
  image_transport::Subscriber sub2 = it.subscribe("/image_raw_12", 1, imageCallback12);
  image_transport::Subscriber sub3 = it.subscribe("/image_raw_13", 1, imageCallback13);
  image_transport::Subscriber sub4 = it.subscribe("/image_raw_14", 1, imageCallback14);
  image_transport::Subscriber sub5 = it.subscribe("/image_raw_2", 1, imageCallback2);
  image_transport::Subscriber sub6 = it.subscribe("/image_raw_3", 1, imageCallback3);
  image_transport::Subscriber sub7 = it.subscribe("/image_raw_41", 1, imageCallback41);
  image_transport::Subscriber sub8 = it.subscribe("/image_raw_42", 1, imageCallback42);
  image_transport::Subscriber sub9 = it.subscribe("/image_raw_43", 1, imageCallback43);
  image_transport::Subscriber sub10 = it.subscribe("/image_raw_44", 1, imageCallback44);
  ros::spin();
  // cv::destroyWindow("image2");  //窗口
}