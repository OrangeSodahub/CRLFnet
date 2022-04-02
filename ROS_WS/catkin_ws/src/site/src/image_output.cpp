#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <iostream>

void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
//sensor_msgs::Image ROS中image传递的消息形式
  try
  {
    cv::imshow("image2", cv_bridge::toCvShare(msg, "bgr8")->image);
    if(cv::imwrite("/home/zonlin/ROS/catkin_ws/src/site/camera_data/image.jpg",cv_bridge::toCvShare(msg)->image)>=0)
    {std::cerr << "Saved image.jpg" << std::endl;}
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
  cv::namedWindow("image2");
  cv::startWindowThread();
  image_transport::ImageTransport it(nh);
  image_transport::Subscriber sub = it.subscribe("/image_raw_2", 1, imageCallback);
  ros::spin();
  cv::destroyWindow("image2");  //窗口
}