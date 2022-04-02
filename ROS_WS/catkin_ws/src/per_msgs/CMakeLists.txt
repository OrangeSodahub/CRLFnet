cmake_minimum_required(VERSION 3.0.2)
project(per_msgs)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  gazebo_plugins
  gazebo_ros
  roscpp
  message_generation
)
find_package(gazebo REQUIRED)

################################################
## Declare ROS messages, services and actions ##
################################################

## Generate messages in the 'per_msgs' folder
add_message_files(
  FILES
  SensorMsgsRadar.msg
  GeometryMsgsRadarObject.msg
  )
## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  )


###################################
## catkin specific configuration ##
###################################

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES per_msgs
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

## Mark cpp header files for installation
install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h"
  PATTERN ".svn" EXCLUDE
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
# ${catkin_INCLUDE_DIRS}
)

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/per_msgs.cpp
# )

## Add cmake target dependencies of the library

## Declare a C++ executable
