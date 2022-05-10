

//Master node should guide the master robot autonomously without bumping into
//objects and the slave should subscribe for master position
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"
#include "sensor_msgs/LaserScan.h"
#include "nav_msgs/Odometry.h"
#include "ackermann_msgs/AckermannDriveStamped.h"
#include "pkg/status.h"
#include <sstream>

#define PI 3.14

ros::Publisher status_publisher;
std::string leader_name;
//pkg::status msg.formation is the platoon formation status
// 1: normal formation       2: overtaking

int main(int argc, char **argv)
{
 
  ros::init(argc, argv, "main");

  ros::NodeHandle mainNode;

  status_publisher = mainNode.advertise<pkg::status>("/status", 1000);

  pkg::status a_msg, b_msg;
  a_msg.formation = 1;
  a_msg.leader = "deepracer1";
  a_msg.follower1 = "deepracer2"; a_msg.follower2 = "deepracer3"; 
  a_msg.follower3 = "deepracer4"; a_msg.follower4 = "deepracer5";
  
  b_msg.formation = 2;
  b_msg.leader = "deepracer1";
  b_msg.follower1 = "deepracer2"; b_msg.follower2 = "deepracer3"; 
  b_msg.follower3 = "deepracer4"; b_msg.follower4 = "deepracer5";
  ros::Rate loop_rate(100);
  int cnt = 0;
  while (ros::ok())
  {
    cnt++;
    if(cnt>=1000)
    {
      status_publisher.publish(b_msg);
      cnt = 1000;
    }else if(cnt>=300)
    {
      status_publisher.publish(a_msg);
    }
    loop_rate.sleep();
  }
 
  return 0;
}