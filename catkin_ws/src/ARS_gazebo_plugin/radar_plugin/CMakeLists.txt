cmake_minimum_required(VERSION 2.8.3)
project(radar_plugin)

add_definitions(-std=c++11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(catkin REQUIRED COMPONENTS
  gazebo_plugins
  gazebo_ros
  roscpp
  message_generation
  per_msgs
)
find_package(gazebo REQUIRED)
#find_package(per_msgs REQUIRED)


################################################
## Declare ROS messages, services and actions ##
################################################
    
###################################
## catkin specific configuration ##
###################################
catkin_package(DEPENDS
  roscpp
  gazebo_ros
  per_msgs
)
catkin_package(
 INCLUDE_DIRS include
 # LIBRARIES gazebo_radar_plugin
 CATKIN_DEPENDS gazebo_ros message_runtime roscpp
#  DEPENDS system_lib
)

## Mark cpp header files for installation
install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h"
  PATTERN ".svn" EXCLUDE
)

link_directories(${GAZEBO_LIBRARY_DIRS})

include_directories(
  include
  ${Boost_INCLUDE_DIR}
  ${catkin_INCLUDE_DIRS}
  ${GAZEBO_INCLUDE_DIRS}
)

add_executable(radarMsgCombiner src/radar_combiner.cpp)

add_library(radar_plugin src/radar_plugin.cpp)
#add_library(radar_srr_plugin src/radar_srr_plugin.cpp)

add_dependencies(radar_plugin ${catkin_EXPORTED_TARGETS})
#add_dependencies(radar_srr_plugin ${catkin_EXPORTED_TARGETS})

target_link_libraries(radarMsgCombiner ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})
target_link_libraries(radar_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})
#target_link_libraries(radar_srr_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})