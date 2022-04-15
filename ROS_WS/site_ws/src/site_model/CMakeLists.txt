cmake_minimum_required(VERSION 2.8.3)

project(site_model)

## Add support for C++11, supported in ROS Kinetic and newer

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
	per_msgs
	message_generation
)
find_package(catkin REQUIRED)
find_package(roslaunch)
find_package(gazebo REQUIRED)
find_package(PCL 1.10 REQUIRED)
find_package(OpenCV 3.4.16 REQUIRED)
find_package(Boost COMPONENTS program_options REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

# 增加PCL库的依赖
FIND_PACKAGE( PCL REQUIRED COMPONENTS common io visualization )

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

################################################
## Declare ROS messages, services and actions ##
################################################
		
			
			
###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS})

## Declare a C++ library
# add_library(${PROJECT_NAME}

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

## Add cmake target dependencies of the executable
## same as for the library above
add_dependencies(${ros_logical_camera_plugin_name} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})


# Declare the executable target built from your sources
add_definitions(${PCL_DEFINITIONS})
add_executable(point_cloud_write src/data_output/point_cloud_write.cpp)
add_executable(image_output src/data_output/image_output.cpp)
add_executable(point_cloud_merge src/point_cloud_preprocess/point_cloud_merge.cpp)
add_executable(cloud_viewer src/point_cloud_preprocess/cloud_viewer.cpp)
add_executable(point_cloud_filter src/point_cloud_preprocess/point_cloud_filter.cpp)
add_executable(point_cloud_segmentation_RANSAC src/point_cloud_preprocess/point_cloud_segmentation_RANSAC.cpp)
add_executable(point_cloud_segmentation_ou_cluster src/point_cloud_preprocess/point_cloud_segmentation_ou_cluster.cpp)
add_executable(pcd2bin src/point_cloud_preprocess/pcd2bin.cpp)
add_executable(bin2pcd src/point_cloud_preprocess/bin2pcd.cpp)
add_executable(point_cloud_segmentation_on_regioin_growing src/point_cloud_preprocess/point_cloud_segmentation_on_regioin_growing.cpp)
add_executable(point_cloud_segmentation_on_normals src/point_cloud_preprocess/point_cloud_segmentation_on_normals.cpp)
add_executable(radar_listener src/data_output/radar_listener.cpp)

# Link your application with libraries
target_link_libraries(point_cloud_write ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(image_output ${catkin_LIBRARIES} ${OpenCV_LIBS})
target_link_libraries(point_cloud_merge ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(cloud_viewer ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_filter ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_RANSAC ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_ou_cluster ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(pcd2bin ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(bin2pcd ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_on_regioin_growing ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_on_normals ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(radar_listener ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)

#############
## Install ##
#############

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )
install(TARGETS bin2pcd RUNTIME DESTINATION bin)