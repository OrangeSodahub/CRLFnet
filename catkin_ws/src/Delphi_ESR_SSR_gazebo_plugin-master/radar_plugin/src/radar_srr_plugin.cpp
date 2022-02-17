#include <radar_srr_plugin/radar_srr_plugin.h>
#include <gazebo-9/gazebo/physics/Link.hh>
#include <gazebo-9/gazebo/physics/Model.hh>
#include <gazebo-9/gazebo/physics/World.hh>
#include <gazebo-9/gazebo/sensors/Sensor.hh>
#include <gazebo-9/gazebo/sensors/SensorManager.hh>
#include <gazebo-9/gazebo/sensors/sensors.hh>
#include <stdio.h>
#include <string>
#include <algorithm>
#include <std_msgs/String.h>
#include <per_msgs/SensorMsgsRadar.h>
#include <per_msgs/GeometryMsgsRadarObject.h>
#include <ignition/math4/ignition/math/Pose3.hh>
#include <ignition/math4/ignition/math/Vector3.hh>
#include <ignition/math4/ignition/math/Quaternion.hh>
#include <tf/LinearMath/Scalar.h>

using namespace gazebo;

GZ_REGISTER_MODEL_PLUGIN(RadarSRRPlugin);

RadarSRRPlugin::RadarSRRPlugin() {

}

RadarSRRPlugin::~RadarSRRPlugin() {
	this->rosNode->shutdown();
}

/*  Load the radar plugin
 *   Initialises the Gazebo transport node, ROS node, gets parameters from SDF
 */  
void RadarSRRPlugin::Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf) {
	this->world = _parent->GetWorld();
	if (!ros::isInitialized()) {
		ROS_FATAL_STREAM("A ROS node for Gazebo has not been initialised, unable to load plugin.");
		return;
	}
	this->sensorModel = _parent;
	//Transport node for getting logical camera data
	this->node = transport::NodePtr(new transport::Node());
	this->node->Init();

	//ROS node for subscribers and radar publisher
	this->rosNode = new ros::NodeHandle();
	this->name = _parent->GetName();
	std::string radarROSTopic = this->name;
	//Get topic name for radar publisher from SDF
	if (_sdf->HasElement("topic")) {
		radarROSTopic = _sdf->Get<std::string>("topic");
	}

	this->radarName = "/SRRRight";
	//Get radar frame from SDF
	if (_sdf->HasElement("radarName")) {
		_sdf->GetElement("radarName")->GetValue()->Get(this->radarName);
	}
	this->radarFrame = this->radarName + "_link";

	//Search for logical cameras on parent model
	this->FindLogicalCamera();
	if (!this->logicalCamera) {
		gzerr << "Logical camera not found on any link.\n";
		return;
	}

	this->nearRange = 0.5;
	//Get minimum range of radar from SDF
	if (_sdf->HasElement("near")) {
		_sdf->GetElement("near")->GetValue()->Get(this->nearRange);
	}

	this->farRange = 80.0;
	//Get maximum range of radar from SDF
	if (_sdf->HasElement("far")) {
		_sdf->GetElement("far")->GetValue()->Get(this->farRange);
	}

	this->hfov = 2.6167;
	//Get horizontal FOV from SDF
	if (_sdf->HasElement("hfov")) {
		_sdf->GetElement("hfov")->GetValue()->Get(this->hfov);
	}

	this->vfov = 0.1744;
	//Get vertical FOV from SDF
	if (_sdf->HasElement("vfov")) {
		_sdf->GetElement("vfov")->GetValue()->Get(this->vfov);
	}

	this->velTopic = "/sim_car/vel_of_car";
	//Get topic for car velocity from SDF
	if (_sdf->HasElement("velTopic")) {
		_sdf->GetElement("velTopic")->GetValue()->Get(this->velTopic);
	}

	this->radarPointSamples = 20;
	//Value of "samples" is the square root of total number of points that are considered on an object while checking occlusion
	if (_sdf->HasElement("samples")) {
		_sdf->GetElement("samples")->GetValue()->Get(this->radarPointSamples);
	}

	//Get noise parameters from SDF
	if (_sdf->HasElement("noise")) {
		this->noiseModel = sensors::NoiseFactory::NewNoiseModel(_sdf->GetElement("noise"), "logical_camera");
	}

	this->occlusion = 0.6;
	//Get occlusion allowance percentage from SDF
	if (_sdf->HasElement("occlusion")) {
		_sdf->GetElement("occlusion")->GetValue()->Get(this->occlusion);
	}

	//Subscribers for the logical camera
	this->imageSub = this->node->Subscribe(this->logicalCamera->Topic(), &RadarSRRPlugin::imageCB, this);
	//Publisher for radar_obstacles messages
	this->radarPublisher = this->rosNode->advertise<per_msgs::SensorMsgsRadar>(radarROSTopic, 1, true);
	//Subscribe to velocity topic of the parent vehicle (Default: /sim_car/vel_of_car)
	this->velSubscriber = this->rosNode->subscribe(this->velTopic, 1, &RadarSRRPlugin::velCB, this);
	//Subscribe to model states published by Gazebo
	this->modelStateSubscriber = this->rosNode->subscribe("/gazebo/model_states", 1, &RadarSRRPlugin::modelStateCB, this);
}

/*
 *   This function searches all the links of the parent model for the logical camera
 */
void RadarSRRPlugin::FindLogicalCamera() {
	sensors::SensorManager *sensorManager = sensors::SensorManager::Instance();
	for (physics::LinkPtr link : this->sensorModel->GetLinks()) {
		for (unsigned int i=0; i<link->GetSensorCount(); ++i) {
			sensors::SensorPtr sensor = sensorManager->GetSensor(link->GetSensorName(i));
			if (sensor->Type() == "logical_camera" && sensor->Name() == this->radarName + "_logical_camera") {
				this->logicalCamera = sensor;
			}
		}
		if (this->logicalCamera) {
			this->logicalCameraSensorLink = link;
			break;
		}
	}
}

/*
 *   This function adds noise to any Vector3d element as defined by the noise parameters in the SDF
 */
void RadarSRRPlugin::AddNoise(ignition::math::Vector3d &pos) {
	pos.X() = this->noiseModel->Apply(pos.X());
	pos.Y() = this->noiseModel->Apply(pos.Y());
	pos.Z() = this->noiseModel->Apply(pos.Z());
}

/*
 *   This function is a callback for the parent velocity subscriber, and temporarily stores the current velocity value
 */
void RadarSRRPlugin::velCB(const geometry_msgs::TwistConstPtr &twist) {
	this->currentCarLinearVel = twist->linear;
}

/*
 *   This function is a callback for the model states subscriber, and temporarily stores the current ModelStates message
 */
void RadarSRRPlugin::modelStateCB(const gazebo_msgs::ModelStatesConstPtr &states) {
	this->modelStates = *states;
}

/*
 *   This function is a callback for the logical camera
 *   It stores all the objects in its view and checks for occlusion by checking ray intersections with bounding boxes of all the objects
 *   Then it returns the pose, along with noise addition, of the objects that are clear
 *   Finally it publishes all the relevant data to the radar_obstacles topic
 */
void RadarSRRPlugin::imageCB(const ConstLogicalCameraImagePtr &_msg) {
	this->sensorMsg.header.stamp = ros::Time::now();
	this->sensorMsg.header.frame_id = "/base_link";

	ignition::math::Pose3d cameraPose = gazebo::msgs::ConvertIgn(_msg->pose());
	int k = 0;
	//Add all models in view except ground_plane to the vector ModelsInView
	for (int i=0; i<_msg->model_size(); ++i) {
		if (_msg->model(i).name() == "ground_plane") {
			continue;
		}
		gazebo::physics::ModelPtr model = this->world->ModelByName(_msg->model(i).name());
		this->ModelsInView.push_back(model);
	}

	//Loop for each model in view
	for (int i=0; i<_msg->model_size() && i<64; ++i) {
		std::string modelName = _msg->model(i).name();
		if (modelName == "ground_plane") {
			continue;
		}

		gazebo::physics::ModelPtr this_model = this->world->ModelByName(modelName);
		ignition::math::Box modelBB = this_model->CollisionBoundingBox();

		//Get minimum and maximum x,y coordinates of the bounding box
		float xMin = modelBB.Min().X();
		float yMin = modelBB.Min().Y();
		float xMax = modelBB.Max().X();
		float yMax = modelBB.Max().Y();
		float sampleResX = (xMax - xMin) / this->radarPointSamples;
		float sampleResY = (yMax - yMin) / this->radarPointSamples;

		//Get all the sampled points of the model bounding box that are in the radar's plane
		for (float p=xMin; p<=xMax; p+=sampleResX) {
			for (float q=yMin; q<=yMax; q+=sampleResY) {
				this->currentPoint.Set(p, q, cameraPose.Pos().Z());
				this->bbPointsInRadarPlane.push_back(this->currentPoint);
			}
		}
		int points = this->bbPointsInRadarPlane.size();
		int blockedPoints = 0;

		//For each sampled point, check for occlusion by any other object in view
		for (int j=0; j<points; j++) {
			std::tuple<bool, double, ignition::math::Vector3d> collisionResult = modelBB.Intersect(cameraPose.Pos(), (this->bbPointsInRadarPlane[j] - cameraPose.Pos()), 1.0, 60.0);
			bool result = std::get<0>(collisionResult);
			double objDist = std::get<1>(collisionResult);
			if (!result) {
				continue;
			}
			bool blockFlag = false;
			for (int s=0; s<this->ModelsInView.size(); s++) {
				if (this->ModelsInView[s]->GetName() == modelName) {
					continue;
				}
				else {
					ignition::math::Box tempBB = this->ModelsInView[s]->CollisionBoundingBox();
					blockFlag = tempBB.IntersectCheck(cameraPose.Pos(), (this->bbPointsInRadarPlane[j] - cameraPose.Pos()), 1.0, objDist);
				}
				//If a ray to the current point is blocked, increase count of the number of blocked points
				if (blockFlag) {
					blockedPoints += 1;
					blockFlag = false;
				}
			}
		}

		//If occlusion is more than specified level, do not publish object
		if ((blockedPoints / points) > this->occlusion) {
			if (k != 0) {
				k -= 1;
			}
			if (this->radarName == "SRRRight") {
				if (this->sensorMsg.total_fsm4_tracks != 0) {
					this->sensorMsg.total_fsm4_tracks -= 1;
				}
			}
			else if (this->radarName == "SRRLeft") {
				if (this->sensorMsg.total_rear_sbmp_tracks != 0) {
					this->sensorMsg.total_rear_sbmp_tracks -= 1;
				}
			}
			this->blockedModelsNames.push_back(modelName);
			continue;
		}

		this->clearModelsNames.push_back(modelName);

		ignition::math::Pose3d modelRelativePose = gazebo::msgs::ConvertIgn(_msg->model(i).pose());
		ignition::math::Vector3d modelRelativeVec = modelRelativePose.Pos();
		this->AddNoise(modelRelativeVec);

		//Get the model's velocity
		geometry_msgs::Twist modelTwist;
		for (int j=0; j<this->modelStates.name.size(); j++) {
			if (this->modelStates.name[j] == modelName) {
				modelTwist = this->modelStates.twist[j];
			}
			else {
				continue;
			}
		}
		this->modelLinearVel = modelTwist.linear;

		//Calculate relative velocity of the model
		ignition::math::Vector3d relativeVel = ignition::math::Vector3d((this->modelLinearVel.x - this->currentCarLinearVel.x), (this->modelLinearVel.y - this->currentCarLinearVel.y), (this->modelLinearVel.z - this->currentCarLinearVel.z));
		//Project the relative velocity on the range vector to get range_rate
		double rangeVelDot = relativeVel.Dot(modelRelativeVec);
		ignition::math::Vector3d rangeVel = (rangeVelDot / (modelRelativeVec.Length() * modelRelativeVec.Length())) * modelRelativeVec;
		int sign = 1;
		if (rangeVelDot < 0) {
			sign = -1;
		}

		//Since the pose obtained is with respect to the camera frame, transform it to base_link frame
		try {
			this->_listener.waitForTransform("/base_link", this->radarFrame, ros::Time::now(), ros::Duration(1.0));
			this->_listener.lookupTransform("/base_link", this->radarFrame, ros::Time(0), this->_transform);
		}
		catch (tf::TransformException ex) {
			continue;
		}

		tf::Vector3 transformVec = this->_transform.getOrigin();
		tf::Quaternion transformQuat = this->_transform.getRotation();
		tfScalar transformAngle = transformQuat.getAngle();
		tf::Vector3 transformAxis = transformQuat.getAxis();
		tf::Vector3 modelRelativeTfVec(modelRelativeVec.X(), modelRelativeVec.Y(), modelRelativeVec.Z());
		tf::Vector3 tempVec = modelRelativeTfVec.rotate(transformAxis, transformAngle);
		tf::Vector3 finalVec = tempVec + transformVec;
		ignition::math::Vector3d modelPoseVec(finalVec.getX(), finalVec.getY(), finalVec.getZ());

		//Add relevant data for the radar_obstacles message
		this->radarObj.obj_vcs_posex = modelPoseVec.X();
		this->radarObj.obj_vcs_posey = modelPoseVec.Y();
		this->radarObj.range = hypot(modelRelativeVec.X(), modelRelativeVec.Y());
		this->radarObj.range_rate = sign * rangeVel.Length();
		this->radarObj.angle_centroid = (atan2((modelRelativePose.Pos().Y()), modelRelativePose.Pos().X())) * (180 / 3.1416);
		//Check if the object angle_centroid is in the right range
		if ((abs(this->radarObj.angle_centroid) * (3.1416 / 180)) > (this->hfov / 2)) {
			if (k != 0) {
				k -= 1;
			}
			if (this->radarName == "SRRRight") {
				if (this->sensorMsg.total_fsm4_tracks != 0) {
					this->sensorMsg.total_fsm4_tracks -= 1;
				}
			}
			else if (this->radarName == "SRRLeft") {
				if (this->sensorMsg.total_rear_sbmp_tracks != 0) {
					this->sensorMsg.total_rear_sbmp_tracks -= 1;
				}
			}
			continue;
		}
		else {
			this->radarObj.track_id = k++;
			if (this->radarName == "SRRRight") {
				this->sensorMsg.fsm4_tracklist.push_back(this->radarObj);
			}
			else if (this->radarName == "SRRLeft") {
				this->sensorMsg.rear_sbmp_tracklist.push_back(this->radarObj);
			}
		}
		this->bbPointsInRadarPlane.clear();
	}

	//Publish radar_obstacles message and clear all the vectors used
	if (this->radarName == "SRRRight") {
		this->sensorMsg.fsm4_tracker_counter += this->sensorMsg.total_fsm4_tracks;
	}
	else if (this->radarName == "SRRLeft") {
		this->sensorMsg.rear_sbmp_tracker_counter += this->sensorMsg.total_rear_sbmp_tracks;
	}
	this->radarPublisher.publish(this->sensorMsg);
	this->sensorMsg.fsm4_tracklist.clear();
	this->sensorMsg.rear_sbmp_tracklist.clear();
	this->ModelsInView.clear();
	this->blockedModelsNames.clear();
	this->clearModelsNames.clear();
}
