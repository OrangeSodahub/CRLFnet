#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include "sensor_msgs/LaserScan.h"
#include "ackermann_msgs/AckermannDriveStamped.h"
#include "pkg/status.h"
#include "tf/tf.h"

#define PI 3.1415926535

ros::Publisher slave_vel;
ackermann_msgs::AckermannDriveStamped vel_msg;
std::string leader_name;
std::string follower1;
std::string follower2;
std::string follower3;
std::string follower4;
int isformation;

nav_msgs::Odometry ldmsg,f3msg,f4msg,f2msg,msg1,msg2,msg3,msg4,msg5;
bool pose_flag = false;

int overtake_phase = 1;

double getmodule(geometry_msgs::Vector3 v);

//Function declerations to move
void avoid(void);
void rotate (double angular_speed, double relative_angle, bool clockwise);
void overtake (void);
void followf2 ();
void followf3 ();
//Call back function decleration
void laserCallBack(const sensor_msgs::LaserScan::ConstPtr & laser_msg); 
void statusCallBack(const pkg::status::ConstPtr & status_msg);
void poseCallback1(const nav_msgs::Odometry::ConstPtr& msg);
void poseCallback2(const nav_msgs::Odometry::ConstPtr& msg);
void poseCallback3(const nav_msgs::Odometry::ConstPtr& msg);
void poseCallback4(const nav_msgs::Odometry::ConstPtr& msg);
void poseCallback5(const nav_msgs::Odometry::ConstPtr& msg);

int main(int argc, char** argv)
{
  ros::init(argc, argv, "follower2");

  ros::NodeHandle node;

  ros::Subscriber platoon_status = node.subscribe("/status", 1, statusCallBack);
  ros::Subscriber pose1 = node.subscribe("/deepracer1/base_pose_ground_truth", 10, poseCallback1);
  ros::Subscriber pose2 = node.subscribe("/deepracer2/base_pose_ground_truth", 10, poseCallback2);
  ros::Subscriber pose3 = node.subscribe("/deepracer3/base_pose_ground_truth", 10, poseCallback3);
  ros::Subscriber pose4 = node.subscribe("/deepracer4/base_pose_ground_truth", 10, poseCallback4);
  ros::Subscriber pose5 = node.subscribe("/deepracer5/base_pose_ground_truth", 10, poseCallback5);
  
  ros::Rate rate(100.0);
  while (ros::ok())
  {
    ros::spinOnce();
    if(follower2!="")
    {
      slave_vel =
      node.advertise<ackermann_msgs::AckermannDriveStamped>(follower4+"/ackermann_cmd_mux/output", 100);

      vel_msg.header.stamp = ros::Time::now();
      vel_msg.header.frame_id = follower2+"/base_link";
      
      if(isformation == 4)
      {
        if(pose_flag)
        {
          switch(follower4[9]-'0')
        {
          case 1:
            f4msg = msg1; break;
          case 2:
            f4msg = msg2; break;
          case 3:
            f4msg = msg3; break;
          case 4:
            f4msg = msg4; break;
          case 5:
            f4msg = msg5; break;
        }
          switch(follower2[9]-'0')
        {
          case 1:
            f2msg = msg1; break;
          case 2:
            f2msg = msg2; break;
          case 3:
            f2msg = msg3; break;
          case 4:
            f2msg = msg4; break;
          case 5:
            f2msg = msg5; break;
        }
          switch(follower3[9]-'0')
        {
          case 1:
            f3msg = msg1; break;
          case 2:
            f3msg = msg2; break;
          case 3:
            f3msg = msg3; break;
          case 4:
            f3msg = msg4; break;
          case 5:
            f3msg = msg5; break;
        }
          followf2();
        }
      }else
      if(isformation == 5)
      {
        if(pose_flag)
        {
           switch(leader_name[9]-'0')
        {
          case 1:
            ldmsg = msg1; break;
          case 2:
            ldmsg = msg2; break;
          case 3:
            ldmsg = msg3; break;
          case 4:
            ldmsg = msg4; break;
          case 5:
            ldmsg = msg5; break;
        }
   
          switch(follower4[9]-'0')
        {
          case 1:
            f4msg = msg1; break;
          case 2:
            f4msg = msg2; break;
          case 3:
            f4msg = msg3; break;
          case 4:
            f4msg = msg4; break;
          case 5:
            f4msg = msg5; break;
        }
          switch(follower2[9]-'0')
        {
          case 1:
            f2msg = msg1; break;
          case 2:
            f2msg = msg2; break;
          case 3:
            f2msg = msg3; break;
          case 4:
            f2msg = msg4; break;
          case 5:
            f2msg = msg5; break;
        }
          switch(follower3[9]-'0')
        {
          case 1:
            f3msg = msg1; break;
          case 2:
            f3msg = msg2; break;
          case 3:
            f3msg = msg3; break;
          case 4:
            f3msg = msg4; break;
          case 5:
            f3msg = msg5; break;
        }
          overtake();
        }
      }else
      {
        if(pose_flag)
        {
          switch(follower4[9]-'0')
        {
          case 1:
            f4msg = msg1; break;
          case 2:
            f4msg = msg2; break;
          case 3:
            f4msg = msg3; break;
          case 4:
            f4msg = msg4; break;
          case 5:
            f4msg = msg5; break;
        }
          switch(follower2[9]-'0')
        {
          case 1:
            f2msg = msg1; break;
          case 2:
            f2msg = msg2; break;
          case 3:
            f2msg = msg3; break;
          case 4:
            f2msg = msg4; break;
          case 5:
            f2msg = msg5; break;
        }
          switch(follower3[9]-'0')
        {
          case 1:
            f3msg = msg1; break;
          case 2:
            f3msg = msg2; break;
          case 3:
            f3msg = msg3; break;
          case 4:
            f3msg = msg4; break;
          case 5:
            f3msg = msg5; break;
        }
          followf3();
        }
      }
    }
    rate.sleep();
  }
  return 0;
};


void followf2 ()
{
  tf::Quaternion f4orientation,f2orientation,f3orientation;
  tf::quaternionMsgToTF(f4msg.pose.pose.orientation, f4orientation);
  tf::quaternionMsgToTF(f2msg.pose.pose.orientation, f2orientation);
  tf::quaternionMsgToTF(f3msg.pose.pose.orientation, f3orientation);
  double theta = atan2(f3msg.pose.pose.position.y-f4msg.pose.pose.position.y,
                                 f3msg.pose.pose.position.x-f4msg.pose.pose.position.x) - f2orientation.getAngle();
  double theta1 = atan2(f2msg.pose.pose.position.y-f4msg.pose.pose.position.y,
                                 f2msg.pose.pose.position.x-f4msg.pose.pose.position.x) - f2orientation.getAngle();
 
  double r = sqrt(pow(f4msg.pose.pose.position.x-f3msg.pose.pose.position.x, 2) +
                                  pow(f3msg.pose.pose.position.y-f4msg.pose.pose.position.y, 2));
  double r1 = sqrt(pow(f2msg.pose.pose.position.x-f4msg.pose.pose.position.x, 2) +
                                  pow(f2msg.pose.pose.position.y-f4msg.pose.pose.position.y, 2));
  double alpha = PI/2 - f4orientation.getAngle();
  double e = f4msg.pose.pose.position.x - 1.87;
  double k = 1;
  if(r1 > 0.4)
  {
    vel_msg.drive.speed = 0.3 * r1;
  }else
  {
    vel_msg.drive.speed = 0;
  }
  vel_msg.drive.steering_angle = atan2(k*e,1) + alpha;
  slave_vel.publish(vel_msg);
}

void followf3 ()
{
   tf::Quaternion f4orientation,f2orientation,f3orientation;
  tf::quaternionMsgToTF(f4msg.pose.pose.orientation, f4orientation);
  tf::quaternionMsgToTF(f2msg.pose.pose.orientation, f2orientation);
  tf::quaternionMsgToTF(f3msg.pose.pose.orientation, f3orientation);
  double theta = atan2(f3msg.pose.pose.position.y-f4msg.pose.pose.position.y,
                                 f3msg.pose.pose.position.x-f4msg.pose.pose.position.x) - f2orientation.getAngle();
  double theta1 = atan2(f2msg.pose.pose.position.y-f4msg.pose.pose.position.y,
                                 f2msg.pose.pose.position.x-f4msg.pose.pose.position.x) - f2orientation.getAngle();
 
  double r = sqrt(pow(f4msg.pose.pose.position.x-f3msg.pose.pose.position.x, 2) +
                                  pow(f3msg.pose.pose.position.y-f4msg.pose.pose.position.y, 2));
  double r1 = sqrt(pow(f2msg.pose.pose.position.x-f4msg.pose.pose.position.x, 2) +
                                  pow(f2msg.pose.pose.position.y-f4msg.pose.pose.position.y, 2));
  double alpha = PI/2 - f4orientation.getAngle();
  double e = f4msg.pose.pose.position.x - 1.87;
  double k = 1;
  if(r1 > 0.4 && r > 0.4)
  {
    vel_msg.drive.speed = 0.3 * r;
  }else
  {
    vel_msg.drive.speed = 0;
  }
  vel_msg.drive.steering_angle = atan2(k*e,1) + alpha;
  slave_vel.publish(vel_msg);
}

void overtake (void)
{
  
  tf::Quaternion f4orientation,f2orientation,f3orientation;
  tf::quaternionMsgToTF(f4msg.pose.pose.orientation, f4orientation);
  tf::quaternionMsgToTF(f2msg.pose.pose.orientation, f2orientation);
  tf::quaternionMsgToTF(f3msg.pose.pose.orientation, f3orientation);
  //get vertical distance between ld and f3
  double y_ld_f4 = ldmsg.pose.pose.position.y - f4msg.pose.pose.position.y;
  double x_f3_f4 = f3msg.pose.pose.position.x - f4msg.pose.pose.position.x;
  double alpha = f3orientation.getAngle()-f4orientation.getAngle();
  
  if(overtake_phase == 1) 
  {
    overtake_phase = 1;
    double e = 0.25 - x_f3_f4;//left 30cm lane
    double k = 4;

    //f1's speed is a little faster than ld
    vel_msg.drive.speed = getmodule(f3msg.twist.twist.linear)-0.05;

    //Stanley method
    vel_msg.drive.steering_angle = atan2(k*e,1) + alpha;
    
    if(abs(alpha) < 0.05)
    {
      overtake_phase = 2;
    }
  }else if(overtake_phase == 2)
  {
    double e = 0.25 - x_f3_f4;//original lane
    double k = 3;
    //f1's speed is a little faster than ld
    vel_msg.drive.speed = getmodule(ldmsg.twist.twist.linear) + 0.1;

    //Stanley method
    vel_msg.drive.steering_angle = atan2(k*e,1) + alpha;
    
    //overtake finish condition
    if(y_ld_f4 < -0.4)
    {
      overtake_phase = 3;
    }
  }else if(overtake_phase == 3)
  {
    //??
    double e = 0 - x_f3_f4;//original lane
    double k = 3;
    //f1's speed is a little faster than ld
    vel_msg.drive.speed = getmodule(ldmsg.twist.twist.linear);

    //Stanley method
    vel_msg.drive.steering_angle = atan2(k*e,1) + alpha;
  }
  slave_vel.publish(vel_msg);
}

double getmodule(geometry_msgs::Vector3 v)
{
  double rst = sqrt(pow(v.x,2)+pow(v.y,2)+pow(v.z,2));
  return rst;
}

void laserCallBack(const sensor_msgs::LaserScan::ConstPtr & laser_msg)
{
}

void statusCallBack(const pkg::status::ConstPtr & status_msg)
{
  leader_name = status_msg->leader;
  isformation = status_msg->formation;
  follower1 = status_msg->follower1;
  follower2 = status_msg->follower2;
  follower3 = status_msg->follower3;
  follower4 = status_msg->follower4;
}

void poseCallback1(const nav_msgs::Odometry::ConstPtr& msg)
{
  pose_flag = true;
  msg1.child_frame_id = msg->child_frame_id;
  msg1.header = msg->header;
  msg1.pose = msg->pose;
  msg1.twist = msg->twist;
}

void poseCallback2(const nav_msgs::Odometry::ConstPtr& msg)
{
  pose_flag = true;
  msg2.child_frame_id = msg->child_frame_id;
  msg2.header = msg->header;
  msg2.pose = msg->pose;
  msg2.twist = msg->twist;
}

void poseCallback3(const nav_msgs::Odometry::ConstPtr& msg)
{
  pose_flag = true;
  msg3.child_frame_id = msg->child_frame_id;
  msg3.header = msg->header;
  msg3.pose = msg->pose;
  msg3.twist = msg->twist;
}

void poseCallback4(const nav_msgs::Odometry::ConstPtr& msg)
{
  pose_flag = true;
  msg4.child_frame_id = msg->child_frame_id;
  msg4.header = msg->header;
  msg4.pose = msg->pose;
  msg4.twist = msg->twist;
}

void poseCallback5(const nav_msgs::Odometry::ConstPtr& msg)
{
  pose_flag = true;
  msg5.child_frame_id = msg->child_frame_id;
  msg5.header = msg->header;
  msg5.pose = msg->pose;
  msg5.twist = msg->twist;
}