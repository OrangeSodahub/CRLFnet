/*
 * Copyright 2016-2017 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/

#ifndef _ROS_LOGICAL_CAMERA_PLUGIN_HH_
#define _ROS_LOGICAL_CAMERA_PLUGIN_HH_

#include <string>
#include <vector>

#include <sdf/sdf.hh>

#include "ignition/math/Pose3.hh"
#include "gazebo/common/Plugin.hh"
#include "gazebo/common/UpdateInfo.hh"
#include "gazebo/msgs/logical_camera_image.pb.h"
#include "gazebo/physics/PhysicsTypes.hh"
#include "gazebo/sensors/Noise.hh"
#include "gazebo/transport/Node.hh"
#include "gazebo/transport/Subscriber.hh"
#include "gazebo/transport/TransportTypes.hh"

// ROS
#include "gazebo_radar_plugin/ModeCRadar.h"
#include "gazebo_radar_plugin/ModeCRadarSummary.h"
#include <ros/ros.h>

namespace gazebo
{
  /// \brief ROS publisher for the logical camera
  class ModeCRadarPlugin : public ModelPlugin
  {
    /// \brief Constructor
    public: ModeCRadarPlugin();

    /// \brief Destructor
    public: virtual ~ModeCRadarPlugin();

    /// \brief Model that contains the logical camera
    protected: physics::ModelPtr model;

    /// \brief Gazebo world pointer.
    protected: physics::WorldPtr world;

    /// \brief Link that holds the logical camera
    protected: physics::LinkPtr cameraLink;

    /// \brief The logical camera sensor
    protected: sensors::SensorPtr sensor;

    /// \brief The model name
    protected: std::string name;

    /// \brief The frame_id of the sensor
    protected: std::string radar_sensor_frameid;

    /// \brief The max range for returns (meters)
    protected: double max_range;

    /// \brief The maximum horizontal field of view (radians)
    protected: double hfov;

    /// \brief The maximum vertical field of view (radians)
    protected: double vfov;

    /// \brief Load the plugin.
    /// \param[in] _parent Pointer to the parent model
    /// \param[in] _sdf Pointer to the SDF element of the plugin.
    public: void Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf);

    /// \brief Searches the model links for a logical camera sensor
    protected: void FindLogicalCamera();

    /// \brief Callback for when logical camera images are received
    /// \param[in] _msg The logical camera image
    public: void OnImage(ConstLogicalCameraImagePtr &_msg);

    /// \brief Determine if the model type is one that should be published
    protected: bool ModelTypeToPublish(const std::string & modelType);

    /// \brief Add noise to a model pose
  protected: void AddNoise(ignition::math::Pose3d & pose);

    // \brief Add a radar contact to a radar contact summary if it's within parameters
    protected: void AppendRadarContact(
      gazebo_radar_plugin::ModeCRadarSummary & radar_msg,
      const ignition::math::Pose3d & cameraPose, const ignition::math::Pose3d & modelPose,
      const uint16_t code, const std_msgs::Header & header);

    /// \brief Node for communication with gazebo
    protected: transport::NodePtr node;

    /// \brief Subscription to logical camera image messages from gazebo
    protected: transport::SubscriberPtr imageSub;

    /// \brief for setting ROS name space
    protected: std::string robotNamespace;

    /// \brief ros node handle
    protected: ros::NodeHandle *rosnode;

    /// \brief ROS publisher for the radar returns
    protected: ros::Publisher radarPub;

    /// \brief If true, only publish the models if their type is known; otherwise publish all
    protected: bool onlyPublishKnownModels;

    /// \brief Whitelist of the known model types to detect
    protected: std::vector<std::string> knownModelTypes;

    /// \brief Map of noise IDs to noise models
    protected: std::map<std::string, sensors::NoisePtr> noiseModels;
  };
}
#endif
