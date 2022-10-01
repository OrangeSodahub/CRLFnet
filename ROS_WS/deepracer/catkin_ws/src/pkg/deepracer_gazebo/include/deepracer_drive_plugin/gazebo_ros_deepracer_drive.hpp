///////////////////////////////////////////////////////////////////////////////////
//   Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.          //
//                                                                               //
//   Licensed under the Apache License, Version 2.0 (the "License").             //
//   You may not use this file except in compliance with the License.            //
//   You may obtain a copy of the License at                                     //
//                                                                               //
//       http://www.apache.org/licenses/LICENSE-2.0                              //
//                                                                               //
//   Unless required by applicable law or agreed to in writing, software         //
//   distributed under the License is distributed on an "AS IS" BASIS,           //
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    //
//   See the License for the specific language governing permissions and         //
//   limitations under the License.                                              //
///////////////////////////////////////////////////////////////////////////////////

#ifndef GAZEBO_PLUGINS__GAZEBO_ROS_DEEPRACER_DRIVE_HPP_
#define GAZEBO_PLUGINS__GAZEBO_ROS_DEEPRACER_DRIVE_HPP_

#include <gazebo/common/Plugin.hh>

#include <memory>

namespace gazebo_plugins
{
class GazeboRosDeepRacerDrivePrivate;

/// DeepRacer drive plugin for AWS DeepRacer device. Subscribes to geometry_msgs/twist and publishes velocity and position commands.

/**
  Example Usage:
  \code{.xml}
    plugin name='gazebo_ros_deepracer_drive' filename='libgazebo_ros_deepracer_drive.so'>

      <update_rate>15.0</update_rate>

      <!-- Max absolute steer angle for tyre in radians -->
      <!-- Any cmd_vel angular z greater than this would be capped -->
      <max_steer>0.523599</max_steer>

      <!-- Max absolute linear speed in m/s -->
      <max_speed>4</max_speed>

      <!-- Radius of rear wheels, in meters -->
      <wheel_radius>0.03</wheel_radius>
      <!-- Distance between front and rear axles, in meters -->
      <wheel_base>0.164023</wheel_base>
      <!-- Distance between the wheels, in meters -->
      <wheel_separation>0.159202</wheel_separation>

      <!-- output -->
      <publish_odom>true</publish_odom>
      <publish_odom_tf>true</publish_odom_tf>

      <odometry_frame>odom</odometry_frame>
      <robot_base_frame>base_link</robot_base_frame>

    </plugin>
  \endcode
*/
class GazeboRosDeepRacerDrive : public gazebo::ModelPlugin
{
public:
  /// Constructor
  GazeboRosDeepRacerDrive();

  /// Destructor
  ~GazeboRosDeepRacerDrive();

protected:
  // Documentation inherited
  void Load(gazebo::physics::ModelPtr _model, sdf::ElementPtr _sdf) override;

  // Documentation inherited
  void Reset() override;

private:
  /// Private data pointer
  std::unique_ptr<GazeboRosDeepRacerDrivePrivate> impl_;
};
}  // namespace gazebo_plugins

#endif  // GAZEBO_PLUGINS__GAZEBO_ROS_DEEPRACER_DRIVE_HPP_
