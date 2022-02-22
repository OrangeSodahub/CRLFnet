#include <ros/ros.h>
#include <per_msgs/SensorMsgsRadar.h>

// Class that combines messages from 5 radars into one radar_obstacles message
class radarMsgCombiner {
    public:
        radarMsgCombiner() {
            //Initialise the subscribers to the 5 radars
            esrFrontSub = nh.subscribe("/esr_front_obstacles", 1, &radarMsgCombiner::esrFrontCB, this);
            esrLeftSub = nh.subscribe("/esr_left_obstacles", 1, &radarMsgCombiner::esrLeftCB, this);
            esrRightSub = nh.subscribe("/esr_right_obstacles", 1, &radarMsgCombiner::esrRightCB, this);
            srrLeftSub = nh.subscribe("/srr_left_obstacles", 1, &radarMsgCombiner::srrLeftCB, this);
            srrRightSub = nh.subscribe("/srr_right_obstacles", 1, &radarMsgCombiner::srrRightCB, this);
            //Initialise the final publisher
            radarPub = nh.advertise<per_msgs::SensorMsgsRadar>("/radar_obstacles", 1);
        }
        ~radarMsgCombiner() {}
        void esrFrontCB(const per_msgs::SensorMsgsRadarConstPtr &msg);
        void esrLeftCB(const per_msgs::SensorMsgsRadarConstPtr &msg);
        void esrRightCB(const per_msgs::SensorMsgsRadarConstPtr &msg);
        void srrRightCB(const per_msgs::SensorMsgsRadarConstPtr &msg);
        void srrLeftCB(const per_msgs::SensorMsgsRadarConstPtr &msg);

    private:
        ros::NodeHandle nh;
        ros::Subscriber esrFrontSub, esrRightSub, esrLeftSub, srrRightSub, srrLeftSub;
        ros::Publisher radarPub;

        per_msgs::SensorMsgsRadar thisMsg;
};

// ESRFront callback function
void radarMsgCombiner::esrFrontCB(const per_msgs::SensorMsgsRadarConstPtr &msg) {
    thisMsg.header.seq += 1;
    thisMsg.header.stamp = ros::Time::now();
    thisMsg.header.frame_id = "/base_link";
    thisMsg.total_front_esr_tracks = msg->total_front_esr_tracks;
    thisMsg.front_esr_tracker_counter = msg->front_esr_tracker_counter;
    thisMsg.front_esr_tracklist = msg->front_esr_tracklist;
}

// ESRLeft callback function
void radarMsgCombiner::esrLeftCB(const per_msgs::SensorMsgsRadarConstPtr &msg) {
    thisMsg.header.seq += 1;
    thisMsg.header.stamp = ros::Time::now();
    thisMsg.header.frame_id = "/base_link";
    thisMsg.total_front_left_esr_tracks = msg->total_front_left_esr_tracks;
    thisMsg.front_left_esr_tracker_counter = msg->front_left_esr_tracker_counter;
    thisMsg.front_left_esr_tracklist = msg->front_left_esr_tracklist;
}

// ESRRight callback function
void radarMsgCombiner::esrRightCB(const per_msgs::SensorMsgsRadarConstPtr &msg) {
    thisMsg.header.seq += 1;
    thisMsg.header.stamp = ros::Time::now();
    thisMsg.header.frame_id = "/base_link";
    thisMsg.total_front_right_esr_tracks = msg->total_front_right_esr_tracks;
    thisMsg.front_right_esr_tracker_counter = msg->front_right_esr_tracker_counter;
    thisMsg.front_right_esr_tracklist = msg->front_right_esr_tracklist;
}

// SRRLeft callback function
void radarMsgCombiner::srrLeftCB(const per_msgs::SensorMsgsRadarConstPtr &msg) {
    thisMsg.header.seq += 1;
    thisMsg.header.stamp = ros::Time::now();
    thisMsg.header.frame_id = "/base_link";
    thisMsg.total_rear_sbmp_tracks = msg->total_rear_sbmp_tracks;
    thisMsg.rear_sbmp_tracker_counter = msg->rear_sbmp_tracker_counter;
    thisMsg.rear_sbmp_tracklist = msg->rear_sbmp_tracklist;
}

// SRRRight callback function
void radarMsgCombiner::srrRightCB(const per_msgs::SensorMsgsRadarConstPtr &msg) {
    thisMsg.header.seq += 1;
    thisMsg.header.stamp = ros::Time::now();
    thisMsg.header.frame_id = "/base_link";
    thisMsg.total_fsm4_tracks = msg->total_fsm4_tracks;
    thisMsg.fsm4_tracker_counter = msg->fsm4_tracker_counter;
    thisMsg.fsm4_tracklist = msg->fsm4_tracklist;
    radarPub.publish(thisMsg);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "radarMsgCombiner");

    radarMsgCombiner combinerObj;

    ros::spin();
    return 0;
}