# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "can_msgs;roscpp;socketcan_interface;pb_msgs;geometry_msgs;sensor_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsocketcan_to_topic;-ltopic_to_socketcan;-ldecode;-ldecode_cluster;-lwarning;-lspeedinfo;-lconfiguration".split(';') if "-lsocketcan_to_topic;-ltopic_to_socketcan;-ldecode;-ldecode_cluster;-lwarning;-lspeedinfo;-lconfiguration" != "" else []
PROJECT_NAME = "socketcan_bridge"
PROJECT_SPACE_DIR = "/home/zonlin/ROS/Radar_ws/install"
PROJECT_VERSION = "0.7.6"
