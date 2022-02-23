cmake_minimum_required(VERSION 2.8.3)

project(site)

## Add support for C++11, supported in ROS Kinetic and newer
#---------add_definitions(-std=c++17)
#---------
#---------set(CMAKE_CXX_STANDARD 11)
#---------set(CMAKE_CXX_STANDARD_REQUIRED ON)


###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need

find_package(catkin REQUIRED COMPONENTS
	roscpp
	gazebo_plugins
	gazebo_ros
	pcl_conversions
	pcl_msgs
	pcl_ros
	sensor_msgs
	geometry_msgs
	image_transport
	cv_bridge
	#per_msgs
	message_generation
)
find_package(catkin REQUIRED)
find_package(roslaunch)
find_package(gazebo REQUIRED)
find_package(PCL 1.10 REQUIRED)
find_package(OpenCV 3.4.16 REQUIRED)

# 增加PCL库的依赖
FIND_PACKAGE( PCL REQUIRED COMPONENTS common io visualization )


################################################
## Declare ROS messages, services and actions ##
################################################

#---------## Generate messages in the 'msg' folder
#---------add_message_files(
#---------  FILES
#---------  ModeCRadar.msg
#---------  ModeCRadarSummary.msg
#---------)
#---------## Generate added messages and services with any dependencies listed here
#---------generate_messages(
#---------  DEPENDENCIES
#---------  std_msgs
#---------  geometry_msgs
#---------)

catkin_package(
	INCLUDE_DIRS include
	# LIBRARIES gazebo_radar_plugin
	CATKIN_DEPENDS gazebo_ros message_runtime roscpp
	#  DEPENDS system_lib
	)


###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS})

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/gazebo_radar_plugin.cpp
# )
#---------link_directories(${GAZEBO_LIBRARY_DIRS})
#---------
#---------set(ros_logical_camera_plugin_name ModeCRadarPlugin)
#---------add_library(${ros_logical_camera_plugin_name} src/ModeCRadarPlugin.cc)


foreach(dir config launch meshes urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)

# If the package has been found, several variables will
# be set, you can find the full list with descriptions
# in the OpenCVConfig.cmake file.
# Print some message showing some of them
message(STATUS "OpenCV library status:")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")


## Add cmake target dependencies of the executable
## same as for the library above
add_dependencies(${ros_logical_camera_plugin_name} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})


# Declare the executable target built from your sources
add_definitions(${PCL_DEFINITIONS})
add_executable(point_cloud_write1 src/point_cloud_write1.cpp)
add_executable(point_cloud_write2 src/point_cloud_write2.cpp)
add_executable(point_cloud_write3 src/point_cloud_write3.cpp)
add_executable(cloud_viewer src/cloud_viewer.cpp)
add_executable(point_cloud_filter src/point_cloud_filter.cpp)
add_executable(point_cloud_segmentation src/point_cloud_segmentation.cpp)
add_executable(point_cloud_segmentation_ou_cluster src/point_cloud_segmentation_ou_cluster.cpp)
add_executable(point_cloud_merge src/point_cloud_merge.cpp)
add_executable(image_output src/image_output.cpp)

# Link your application with libraries
target_link_libraries(point_cloud_write1 ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(point_cloud_write2 ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(point_cloud_write3 ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(cloud_viewer ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_filter ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_ou_cluster ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_merge ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(image_output ${catkin_LIBRARIES} ${OpenCV_LIBS})

#############
## Install ##
#############

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

#---------## Mark executables and/or libraries for installation
#---------install(TARGETS ${ros_logical_camera_plugin_name}
#---------  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#---------  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#---------  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
#---------)
#---------
#---------## Mark cpp header files for installation
#---------install(DIRECTORY include/${PROJECT_NAME}/
#---------  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#---------  FILES_MATCHING PATTERN "*.h"
#---------  PATTERN ".svn" EXCLUDE
#---------)