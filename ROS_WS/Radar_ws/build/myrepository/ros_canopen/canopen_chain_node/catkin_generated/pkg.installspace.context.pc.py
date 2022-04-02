# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include".split(';') if "${prefix}/include;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "canopen_master;diagnostic_updater;message_runtime;pluginlib;roscpp;socketcan_interface;std_srvs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lcanopen_ros_chain;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0".split(';') if "-lcanopen_ros_chain;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0" != "" else []
PROJECT_NAME = "canopen_chain_node"
PROJECT_SPACE_DIR = "/home/zonlin/ROS/Radar_ws/install"
PROJECT_VERSION = "0.7.6"
