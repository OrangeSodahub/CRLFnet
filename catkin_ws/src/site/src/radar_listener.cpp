#include "ros/ros.h"
#include "std_msgs/String.h"
#include "radar_pkg/radar_msg.h"

radar_pkg::radar_msg radar_output_msg;

void chatterCallback (const radar_pkg::radar_msg& radar_output_msg)
{
    ROS_INFO("I heard: [%f]", radar_output_msg.distance);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "radar_listener");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("Radar_Data", 1000, chatterCallback);
    ros::spin();
    return 0;
}