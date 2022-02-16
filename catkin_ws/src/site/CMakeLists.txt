cmake_minimum_required(VERSION 2.8.3)

project(site)

find_package(catkin REQUIRED)

catkin_package()

find_package(roslaunch)

find_package(catkin REQUIRED COMPONENTS
	roscpp
	pcl_conversions
	pcl_msgs
	pcl_ros
	sensor_msgs
	geometry_msgs
	image_transport
	cv_bridge
)

find_package(PCL 1.10 REQUIRED)
find_package(OpenCV 3.4.16 REQUIRED)

include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})

# 增加PCL库的依赖
FIND_PACKAGE( PCL REQUIRED COMPONENTS common io visualization )

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

# Declare the executable target built from your sources
add_definitions(${PCL_DEFINITIONS})
add_executable(point_cloud_write1 src/point_cloud_write1.cpp)
add_executable(point_cloud_write2 src/point_cloud_write2.cpp)
add_executable(cloud_viewer src/cloud_viewer.cpp)
add_executable(point_cloud_filter src/point_cloud_filter.cpp)
add_executable(point_cloud_segmentation src/point_cloud_segmentation.cpp)
add_executable(point_cloud_segmentation_ou_cluster src/point_cloud_segmentation_ou_cluster.cpp)
add_executable(image_output src/image_output.cpp)

# Link your application with OpenCV libraries
target_link_libraries(point_cloud_write1 ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(point_cloud_write2 ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(cloud_viewer ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_filter ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(point_cloud_segmentation_ou_cluster ${catkin_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} ${PCL_LIBRARIES} pcl_visualization)
target_link_libraries(image_output ${catkin_LIBRARIES} ${OpenCV_LIBS})