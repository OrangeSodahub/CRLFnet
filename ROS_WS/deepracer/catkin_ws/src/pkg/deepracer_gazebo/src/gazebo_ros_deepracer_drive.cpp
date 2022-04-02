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

#include <gazebo/common/Time.hh>
#include <gazebo/physics/Joint.hh>
#include <gazebo/physics/Link.hh>
#include <gazebo/physics/Model.hh>
#include <gazebo/physics/World.hh>
#include <gazebo/physics/physics.hh>
#include <deepracer_drive_plugin/gazebo_ros_deepracer_drive.hpp>
#include <gazebo_ros/conversions/builtin_interfaces.hpp>
#include <gazebo_ros/conversions/geometry_msgs.hpp>
#include <gazebo_ros/node.hpp>
#include <geometry_msgs/msg/twist.hpp>
#include <nav_msgs/msg/odometry.hpp>
#include <std_msgs/msg/float32.hpp>
#include <std_msgs/msg/float64_multi_array.hpp>
#include <sdf/sdf.hh>

#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/transform_listener.h>

#include <memory>
#include <string>
#include <vector>

namespace gazebo_plugins
{
class GazeboRosDeepRacerDrivePrivate
{
public:
  /// Callback to be called at every simulation iteration.
  /// \param[in] _info Updated simulation info.
  void OnUpdate(const gazebo::common::UpdateInfo & _info);

  /// Callback when a velocity command is received.
  /// \param[in] _msg Twist command message.
  void OnCmdVel(geometry_msgs::msg::Twist::SharedPtr _msg);

  /// Update odometry according to world
  void UpdateOdometryWorld();

  /// Publish odometry transforms
  /// \param[in] _current_time Current simulation time
  void PublishOdometryTf(const gazebo::common::Time & _current_time);

  /// Publish odometry messages
  /// \param[in] _current_time Current simulation time
  void PublishOdometryMsg(const gazebo::common::Time & _current_time);
  
  /// Calculate the target velocity and position
  void CalcTargetVelAndPosition(double& _target_speed, double& _target_left_steering, double& _target_right_steering);

  /// Publish joint velocity and position commands
  void PublishJointVelAndPositionMsg(const double& _target_speed, const double& _target_left_steering, const double& _target_right_steering);

  /// A pointer to the GazeboROS node.
  gazebo_ros::Node::SharedPtr ros_node_;

  /// Subscriber to command velocities
  rclcpp::Subscription<geometry_msgs::msg::Twist>::SharedPtr cmd_vel_sub_;

  /// Odometry publisher
  rclcpp::Publisher<nav_msgs::msg::Odometry>::SharedPtr odometry_pub_;

  /// Velocity and Position controller publishers
  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr left_front_wheel_vel_controller_pub_;

  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr right_front_wheel_vel_controller_pub_;
  
  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr left_rear_wheel_vel_controller_pub_;

  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr right_rear_wheel_vel_controller_pub_;

  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr left_steering_hinge_position_controller_pub_;

  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr right_steering_hinge_position_controller_pub_;

  /// Connection to event called at every world iteration.
  gazebo::event::ConnectionPtr update_connection_;

  /// Pointer to model.
  gazebo::physics::ModelPtr model_;

  /// Distance between the wheels, in meters.
  double wheel_separation_;

  /// Distance between front and rear axles, in meters.
  double wheel_base_;

  /// Radius of rear wheels, in meters.
  double wheel_radius_;

  // Max steering angle
  double max_speed_ = 0;

  // Max steering angle of tyre
  double max_steer_ = 0;

  /// To broadcast TFs
  std::shared_ptr<tf2_ros::TransformBroadcaster> transform_broadcaster_;

  /// Protect variables accessed on callbacks.
  std::mutex lock_;

  /// Linear velocity in X received on command (m/s).
  double target_linear_{0.0};

  /// Angular velocity in Z received on command (rad/s).
  double target_rot_{0.0};

  /// Update period in seconds.
  double update_period_;

  /// Last update time.
  gazebo::common::Time last_update_time_;

  /// Odometry frame ID
  std::string odometry_frame_;

  /// Keep latest odometry message
  nav_msgs::msg::Odometry odom_;

  /// Robot base frame ID
  std::string robot_base_frame_;

  /// True to publish odometry messages.
  bool publish_odom_;

  /// True to publish odom-to-world transforms.
  bool publish_odom_tf_;

  /// Covariance in odometry
  double covariance_[3];

};

GazeboRosDeepRacerDrive::GazeboRosDeepRacerDrive()
: impl_(std::make_unique<GazeboRosDeepRacerDrivePrivate>())
{
}

GazeboRosDeepRacerDrive::~GazeboRosDeepRacerDrive()
{
}

void GazeboRosDeepRacerDrive::Load(gazebo::physics::ModelPtr _model, sdf::ElementPtr _sdf)
{
  impl_->model_ = _model;

  auto world = impl_->model_->GetWorld();
  auto physicsEngine = world->Physics();
  physicsEngine->SetParam("friction_model", std::string("cone_model"));

  // Initialize ROS node
  impl_->ros_node_ = gazebo_ros::Node::Get(_sdf);

  // Get QoS profiles
  const gazebo_ros::QoS & qos = impl_->ros_node_->get_qos();

  impl_->max_speed_ = _sdf->Get<double>("max_speed", 4.0).first;
  impl_->max_steer_ = _sdf->Get<double>("max_steer", 0.523599).first;

  impl_->wheel_radius_ = _sdf->Get<double>("wheel_radius", 0.03).first;
  // wheel seperation is the distance between the two rear wheels or two front wheels
  impl_->wheel_separation_ = _sdf->Get<double>("wheel_separation", 0.159202).first;
  // wheel base is the distance between the rear and front wheels
  impl_->wheel_base_ = _sdf->Get<double>("wheel_base", 0.164023).first;

  // Update rate
  auto update_rate = _sdf->Get<double>("update_rate", 100.0).first;
  if (update_rate > 0.0) {
    impl_->update_period_ = 1.0 / update_rate;
  } else {
    impl_->update_period_ = 0.0;
  }
  impl_->last_update_time_ = _model->GetWorld()->SimTime();

  impl_->cmd_vel_sub_ = impl_->ros_node_->create_subscription<geometry_msgs::msg::Twist>(
    "cmd_vel", qos.get_subscription_qos("cmd_vel", rclcpp::QoS(1)),
    std::bind(&GazeboRosDeepRacerDrivePrivate::OnCmdVel, impl_.get(), std::placeholders::_1));

  RCLCPP_INFO(
    impl_->ros_node_->get_logger(), "Subscribed to [%s]", impl_->cmd_vel_sub_->get_topic_name());

  // Odometry
  impl_->odometry_frame_ = _sdf->Get<std::string>("odometry_frame", "odom").first;
  impl_->robot_base_frame_ = _sdf->Get<std::string>("robot_base_frame", "base_footprint").first;

  // Advertise odometry topic
  impl_->publish_odom_ = _sdf->Get<bool>("publish_odom", false).first;
  if (impl_->publish_odom_) {
    impl_->odometry_pub_ = impl_->ros_node_->create_publisher<nav_msgs::msg::Odometry>(
      "odom", qos.get_publisher_qos("odom", rclcpp::QoS(1)));

    RCLCPP_INFO(
      impl_->ros_node_->get_logger(), "Advertise odometry on [%s]",
      impl_->odometry_pub_->get_topic_name());
  }

  impl_->publish_odom_tf_ = _sdf->Get<bool>("publish_odom_tf", false).first;
  if (impl_->publish_odom_tf_) {
    impl_->transform_broadcaster_ =
      std::make_shared<tf2_ros::TransformBroadcaster>(impl_->ros_node_);

    if (impl_->publish_odom_tf_) {
      RCLCPP_INFO(
        impl_->ros_node_->get_logger(),
        "Publishing odom transforms between [%s] and [%s]", impl_->odometry_frame_.c_str(),
        impl_->robot_base_frame_.c_str());
    }
  }

  auto pose = impl_->model_->WorldPose();
  impl_->odom_.pose.pose.position = gazebo_ros::Convert<geometry_msgs::msg::Point>(pose.Pos());
  impl_->odom_.pose.pose.orientation = gazebo_ros::Convert<geometry_msgs::msg::Quaternion>(
    pose.Rot());

  impl_->covariance_[0] = _sdf->Get<double>("covariance_x", 0.00001).first;
  impl_->covariance_[1] = _sdf->Get<double>("covariance_y", 0.00001).first;
  impl_->covariance_[2] = _sdf->Get<double>("covariance_yaw", 0.001).first;

  // Listen to the update event (broadcast every simulation iteration)
  impl_->update_connection_ = gazebo::event::Events::ConnectWorldUpdateBegin(
    std::bind(&GazeboRosDeepRacerDrivePrivate::OnUpdate, impl_.get(), std::placeholders::_1));
    
  impl_->left_front_wheel_vel_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/left_front_wheel_velocity_controller/commands", qos.get_publisher_qos("left_front_wheel_velocity_controller", rclcpp::QoS(1)));

  impl_->right_front_wheel_vel_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/right_front_wheel_velocity_controller/commands", qos.get_publisher_qos("right_front_wheel_velocity_controller", rclcpp::QoS(1)));

  impl_->left_rear_wheel_vel_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/left_rear_wheel_velocity_controller/commands", qos.get_publisher_qos("left_rear_wheel_velocity_controller", rclcpp::QoS(1)));

  impl_->right_rear_wheel_vel_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/right_rear_wheel_velocity_controller/commands", qos.get_publisher_qos("right_rear_wheel_velocity_controller", rclcpp::QoS(1)));

  impl_->left_steering_hinge_position_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/left_steering_hinge_position_controller/commands", qos.get_publisher_qos("left_steering_hinge_position_controller", rclcpp::QoS(1)));

  impl_->right_steering_hinge_position_controller_pub_ = impl_->ros_node_->create_publisher<std_msgs::msg::Float64MultiArray>(
    "/right_steering_hinge_position_controller/commands", qos.get_publisher_qos("right_steering_hinge_position_controller", rclcpp::QoS(1)));

}

void GazeboRosDeepRacerDrive::Reset()
{
  impl_->last_update_time_ = impl_->model_->GetWorld()->SimTime();

  impl_->target_linear_ = 0;
  impl_->target_rot_ = 0;
}

void GazeboRosDeepRacerDrivePrivate::OnUpdate(const gazebo::common::UpdateInfo & _info)
{
  std::lock_guard<std::mutex> lock(lock_);
  double seconds_since_last_update = (_info.simTime - last_update_time_).Double();
  // Update odom
  UpdateOdometryWorld();
  if (seconds_since_last_update < update_period_) {
    return;
  }
  if (publish_odom_) {
    PublishOdometryMsg(_info.simTime);
  }
  if (publish_odom_tf_) {
    PublishOdometryTf(_info.simTime);
  }
  // Calculate the velocity and position values and publish the commands
  double target_speed, target_left_steering, target_right_steering;
  CalcTargetVelAndPosition(target_speed, target_left_steering, target_right_steering);
  PublishJointVelAndPositionMsg(target_speed, target_left_steering, target_right_steering);
  last_update_time_ = _info.simTime;
}

void GazeboRosDeepRacerDrivePrivate::OnCmdVel(const geometry_msgs::msg::Twist::SharedPtr _msg)
{
  std::lock_guard<std::mutex> scoped_lock(lock_);
  target_linear_ = _msg->linear.x;
  target_rot_ = _msg->angular.z;
}

void GazeboRosDeepRacerDrivePrivate::UpdateOdometryWorld()
{
  auto pose = model_->WorldPose();
  odom_.pose.pose.position = gazebo_ros::Convert<geometry_msgs::msg::Point>(pose.Pos());
  odom_.pose.pose.orientation = gazebo_ros::Convert<geometry_msgs::msg::Quaternion>(pose.Rot());

  // Get velocity in odom frame
  auto linear = model_->WorldLinearVel();
  // Convert velocity to child_frame_id(aka base_footprint)
  auto yaw = static_cast<float>(pose.Rot().Yaw());
  odom_.twist.twist.linear.x = cosf(yaw) * linear.X() + sinf(yaw) * linear.Y();
  odom_.twist.twist.linear.y = cosf(yaw) * linear.Y() - sinf(yaw) * linear.X();
}

void GazeboRosDeepRacerDrivePrivate::PublishOdometryTf(const gazebo::common::Time & _current_time)
{
  geometry_msgs::msg::TransformStamped msg;
  msg.header.stamp = gazebo_ros::Convert<builtin_interfaces::msg::Time>(_current_time);
  msg.header.frame_id = odometry_frame_;
  msg.child_frame_id = robot_base_frame_;
  msg.transform.translation =
    gazebo_ros::Convert<geometry_msgs::msg::Vector3>(odom_.pose.pose.position);
  msg.transform.rotation = odom_.pose.pose.orientation;
  transform_broadcaster_->sendTransform(msg);
}

void GazeboRosDeepRacerDrivePrivate::CalcTargetVelAndPosition(double& _target_speed, double& _target_left_steering, double& _target_right_steering)
{
  auto target_linear = ignition::math::clamp(target_linear_, -max_speed_, max_speed_);
  auto target_rot = target_rot_ * copysign(1.0, target_linear_);
  target_rot = ignition::math::clamp(target_rot, -max_steer_, max_steer_);

  double tanSteer = tan(target_rot);

  _target_left_steering =
    atan2(tanSteer, 1.0 - wheel_separation_ / 2.0 / wheel_base_ * tanSteer);
  _target_right_steering =
    atan2(tanSteer, 1.0 + wheel_separation_ / 2.0 / wheel_base_ * tanSteer);

  _target_speed = target_linear / wheel_radius_;
}

void GazeboRosDeepRacerDrivePrivate::PublishJointVelAndPositionMsg(const double& _target_speed, const double& _target_left_steering, const double& _target_right_steering)
{
      
  std_msgs::msg::Float64MultiArray speed_msg;
  std_msgs::msg::Float64MultiArray left_steer_msg;
  std_msgs::msg::Float64MultiArray right_steer_msg;

  speed_msg.data.push_back(_target_speed);
  left_steer_msg.data.push_back(_target_left_steering);
  right_steer_msg.data.push_back(_target_right_steering);
  
  left_front_wheel_vel_controller_pub_->publish(speed_msg);
  right_front_wheel_vel_controller_pub_->publish(speed_msg);
  left_rear_wheel_vel_controller_pub_->publish(speed_msg);
  right_rear_wheel_vel_controller_pub_->publish(speed_msg);
  left_steering_hinge_position_controller_pub_->publish(left_steer_msg);
  right_steering_hinge_position_controller_pub_->publish(right_steer_msg);

}

void GazeboRosDeepRacerDrivePrivate::PublishOdometryMsg(const gazebo::common::Time & _current_time)
{
  // Set covariance
  odom_.pose.covariance[0] = covariance_[0];
  odom_.pose.covariance[7] = covariance_[1];
  odom_.pose.covariance[14] = 1000000000000.0;
  odom_.pose.covariance[21] = 1000000000000.0;
  odom_.pose.covariance[28] = 1000000000000.0;
  odom_.pose.covariance[35] = covariance_[2];

  odom_.twist.covariance[0] = covariance_[0];
  odom_.twist.covariance[7] = covariance_[1];
  odom_.twist.covariance[14] = 1000000000000.0;
  odom_.twist.covariance[21] = 1000000000000.0;
  odom_.twist.covariance[28] = 1000000000000.0;
  odom_.twist.covariance[35] = covariance_[2];

  // Set header
  odom_.header.frame_id = odometry_frame_;
  odom_.child_frame_id = robot_base_frame_;
  odom_.header.stamp = gazebo_ros::Convert<builtin_interfaces::msg::Time>(_current_time);

  // Publish
  odometry_pub_->publish(odom_);
}
GZ_REGISTER_MODEL_PLUGIN(GazeboRosDeepRacerDrive)
}  // namespace gazebo_plugins
