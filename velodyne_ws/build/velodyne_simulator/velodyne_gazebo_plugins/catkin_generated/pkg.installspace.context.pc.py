# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include;/usr/include/gazebo-11;/usr/include/bullet;/usr/include/simbody;/usr/include/sdformat-9.7;/usr/include/ignition/math6;/usr/include/OGRE;/usr/include/OGRE/Terrain;/usr/include/OGRE/Paging;/usr/include/ignition/transport8;/usr/include/ignition/msgs5;/usr/include/ignition/common3;/usr/include/ignition/fuel_tools4".split(';') if "${prefix}/include;/usr/include;/usr/include/gazebo-11;/usr/include/bullet;/usr/include/simbody;/usr/include/sdformat-9.7;/usr/include/ignition/math6;/usr/include/OGRE;/usr/include/OGRE/Terrain;/usr/include/OGRE/Paging;/usr/include/ignition/transport8;/usr/include/ignition/msgs5;/usr/include/ignition/common3;/usr/include/ignition/fuel_tools4" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;gazebo_ros".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgazebo_ros_velodyne_laser;-lgazebo_ros_velodyne_gpu_laser".split(';') if "-lgazebo_ros_velodyne_laser;-lgazebo_ros_velodyne_gpu_laser" != "" else []
PROJECT_NAME = "velodyne_gazebo_plugins"
PROJECT_SPACE_DIR = "/home/zonlin/ROS/velodyne_ws/install"
PROJECT_VERSION = "1.0.12"
