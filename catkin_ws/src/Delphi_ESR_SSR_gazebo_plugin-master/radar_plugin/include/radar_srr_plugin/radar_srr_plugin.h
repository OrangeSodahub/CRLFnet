#ifndef _RADAR_SRR_PLUGIN_H_
#define _RADAR_SRR_PLUGIN_H_

#include <map>
#include <iterator>
#include <ros/ros.h>
#include <gazebo-9/gazebo/gazebo.hh>
#include <gazebo-9/gazebo/physics/PhysicsTypes.hh>
#include <gazebo-9/gazebo/sensors/LogicalCameraSensor.hh>
#include <gazebo-9/gazebo/common/common.hh>
#include <per_msgs/SensorMsgsRadar.h>
#include <per_msgs/GeometryMsgsRadarObject.h>
#include <sensor_msgs/PointCloud2.h>
#include <geometry_msgs/Twist.h>
#include <gazebo_msgs/ModelStates.h>
#include <gazebo_msgs/LinkStates.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <ignition/math4/ignition/math/Vector3.hh>

namespace gazebo {
	class RadarSRRPlugin : public ModelPlugin {
		public:
			RadarSRRPlugin();
			virtual ~RadarSRRPlugin();
			void Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf);
			//Callbacks for the logical camera used
			void imageCB(const ConstLogicalCameraImagePtr &_msg);
			//Callback for the subscriber to the parent car's velocity
			void velCB(const geometry_msgs::TwistConstPtr &twist);
			//Callback for the subscriber to gazebo/model_states
			void modelStateCB(const gazebo_msgs::ModelStatesConstPtr &states);

		protected:
			std::string name, radarName, radarFrame, topicName, velTopic;
			float nearRange, farRange, hfov, vfov, occlusion;
			int radarPointSamples;
			ignition::math::Vector3d currentPoint;
			std::vector<ignition::math::Vector3d> bbPointsInRadarPlane;
			std::vector<gazebo::physics::ModelPtr> ModelsInView;
			std::vector<std::string> blockedModelsNames;
			std::vector<std::string> clearModelsNames;

			// Gazebo objects
			physics::WorldPtr world;
			physics::ModelPtr sensorModel;
			physics::LinkPtr logicalCameraSensorLink;
			sensors::SensorPtr logicalCamera;
			sensors::NoisePtr noiseModel;
			transport::NodePtr node;
			transport::SubscriberPtr imageSub;

			// ROS objects
			ros::NodeHandle *rosNode;
			ros::Publisher radarPublisher;
			ros::Subscriber velSubscriber;
			ros::Subscriber modelStateSubscriber;

			// Radar message objects
			per_msgs::GeometryMsgsRadarObject radarObj;
			per_msgs::SensorMsgsRadar sensorMsg;

			// Objects to get model velocities
			gazebo_msgs::ModelStates modelStates;
			geometry_msgs::Vector3 currentCarLinearVel, modelLinearVel;

			// TF objects
			tf::TransformListener _listener;
			tf::StampedTransform _transform;

			// Function to find logical cameras on parent model
			void FindLogicalCamera();
			// Function to add noise to sensed positions
			void AddNoise(ignition::math::Vector3d &pos);

		private:
			ignition::math::Vector3d transform_to_bl(tf::Transform T_bl_in_radar, ignition::math::Vector3d P_model_in_radar);

	};
}

#endif
