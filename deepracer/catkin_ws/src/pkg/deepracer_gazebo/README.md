# AWS DeepRacer Gazebo Package

## Overview

The AWS DeepRacer repository contains the configuration and launch files to enable ROS Navigation Stack on AWS DeepRacer and control the vehicle using teleop-twist-keyboard, along with the core components to integrate AWS DeepRacer with ROS Navigation stack. For detailed information, see [Introduction to the ROS Navigation stack using AWS DeepRacer Evo](https://github.com/aws-deepracer/aws-deepracer/blob/main/introduction-to-the-ros-navigation-stack-using-aws-deepracer-evo.md).

AWS DeepRacer uses [Ackermann front-wheel steering](https://en.wikipedia.org/wiki/Ackermann_steering_geometry) to turn wheels on the inside and outside of a turn. This mean that the left and right front wheels generally turn at different angles. The **deepracer_gazebo** package contains the **deepracer_drive** gazebo plugin that has subscribes to the `/cmd_vel` topic and publishes the corresponding joint velocity and position commands to move the car in Gazebo environment. It also takes care of publishing the `/odom` messages required by the Nav2 packages.

## License

The source code is released under [Apache 2.0](https://aws.amazon.com/apache-2-0/).

## Plugin Details

### Example:

        <plugin name='gazebo_ros_deepracer_drive' filename='libgazebo_ros_deepracer_drive.so'>

            <update_rate>15.0</update_rate>

            <!-- wheels -->
            <front_left_joint>front_left_wheel_joint</front_left_joint>
            <front_right_joint>front_right_wheel_joint</front_right_joint>
            <rear_left_joint>rear_left_wheel_joint</rear_left_joint>
            <rear_right_joint>rear_right_wheel_joint</rear_right_joint>
            <left_steering_joint>front_left_steer_joint</left_steering_joint>
            <right_steering_joint>front_right_steer_joint</right_steering_joint>

            <!-- Max absolute steer angle for tyre in radians-->
            <!-- Any cmd_vel angular z greater than this would be capped -->
            <max_steer>0.523599</max_steer>

            <!-- Max absolute linear speed in m/s -->
            <max_speed>4</max_speed>

            <!-- output -->
            <publish_odom>true</publish_odom>
            <publish_odom_tf>true</publish_odom_tf>

            <odometry_frame>odom</odometry_frame>
            <robot_base_frame>base_link</robot_base_frame>

        </plugin>

## Node details

#### Subscribed topics

| Topic name | Message type | Description |
|----------- | ------------ | ----------- |
|`/cmd_vel`|`geometry_msgs.msg.Twist`|Message which expresses velocity in free space broken into its linear and angular parts.|

#### Published topics

| Topic name | Message type | Description |
| ---------- | ------------ | ----------- |
|`/left_front_wheel_velocity_controller/commands`|`Float64MultiArray`|This message is used to send the joint velocity command values through gazebo ros control to the left front wheel.|
|`/right_front_wheel_velocity_controller/commands`|`Float64MultiArray`|This message is used to send the joint velocity command values through gazebo ros control to the right front wheel.|
|`/left_rear_wheel_velocity_controller/commands`|`Float64MultiArray`|This message is used to send the joint velocity command values through gazebo ros control to the left rear wheel.|
|`/right_rear_wheel_velocity_controller/commands`|`Float64MultiArray`|This message is used to send the joint velocity command values through gazebo ros control to the right rear wheel.|
|`/left_steering_hinge_position_controller/commands`|`Float64MultiArray`|This message is used to send the joint position command values through gazebo ros control to the left steering hinge.|
|`/right_steering_hinge_position_controller/commands`|`Float64MultiArray`|This message is used to send the joint position command values through gazebo ros control to the right steering hinge.|
|`/odom`|`nav_msgs::msg::Odometry`|This message is used to publish the odometry message containing the pose and twist data.|

#### TF Transformations

| Transformation | Description |
| ---------- | ------------ |
|`odom -> base_link` | The odometry system to provides the odom -> base_link transformation that is required by the ROS Navigation stack.|

#### Other References

* [Gazebo ROS Ackermann Drive](https://github.com/ros-simulation/gazebo_ros_pkgs/blob/ros2/gazebo_plugins/src/gazebo_ros_ackermann_drive.cpp)

## Resources

* [Getting started with AWS DeepRacer OpenSource](https://github.com/aws-deepracer/aws-deepracer-launcher/blob/main/getting-started.md)
* [Introduction to the ROS Navigation stack using AWS DeepRacer Evo](https://github.com/aws-deepracer/aws-deepracer/blob/main/introduction-to-the-ros-navigation-stack-using-aws-deepracer-evo.md)
