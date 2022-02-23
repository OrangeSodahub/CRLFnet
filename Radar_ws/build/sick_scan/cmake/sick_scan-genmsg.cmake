# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sick_scan: 12 messages, 3 services")

set(MSG_I_FLAGS "-Isick_scan:/home/zonlin/ROS/Radar_ws/src/sick_scan/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sick_scan_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" "geometry_msgs/Vector3:geometry_msgs/Quaternion:std_msgs/Header:sensor_msgs/Imu"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" "geometry_msgs/Vector3:geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/PoseWithCovariance:geometry_msgs/TwistWithCovariance:geometry_msgs/Twist"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" "sick_scan/RadarPreHeaderMeasurementParam1Block:sick_scan/RadarPreHeaderDeviceBlock:sick_scan/RadarPreHeaderEncoderBlock:sick_scan/RadarPreHeaderStatusBlock"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" "geometry_msgs/Vector3:sick_scan/RadarPreHeaderDeviceBlock:sick_scan/RadarPreHeaderEncoderBlock:sick_scan/RadarPreHeaderMeasurementParam1Block:sick_scan/RadarPreHeaderStatusBlock:std_msgs/Header:sensor_msgs/PointField:sick_scan/RadarObject:geometry_msgs/Twist:geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/PoseWithCovariance:geometry_msgs/TwistWithCovariance:sensor_msgs/PointCloud2:sick_scan/RadarPreHeader"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" "sick_scan/LFErecFieldMsg:std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_custom_target(_sick_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sick_scan" "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_msg_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)

### Generating Services
_generate_srv_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_srv_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)
_generate_srv_cpp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
)

### Generating Module File
_generate_module_cpp(sick_scan
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sick_scan_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sick_scan_generate_messages sick_scan_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_cpp _sick_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sick_scan_gencpp)
add_dependencies(sick_scan_gencpp sick_scan_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sick_scan_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_msg_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)

### Generating Services
_generate_srv_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_srv_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)
_generate_srv_eus(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
)

### Generating Module File
_generate_module_eus(sick_scan
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sick_scan_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sick_scan_generate_messages sick_scan_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_eus _sick_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sick_scan_geneus)
add_dependencies(sick_scan_geneus sick_scan_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sick_scan_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_msg_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)

### Generating Services
_generate_srv_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_srv_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)
_generate_srv_lisp(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
)

### Generating Module File
_generate_module_lisp(sick_scan
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sick_scan_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sick_scan_generate_messages sick_scan_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_lisp _sick_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sick_scan_genlisp)
add_dependencies(sick_scan_genlisp sick_scan_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sick_scan_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_msg_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)

### Generating Services
_generate_srv_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_srv_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)
_generate_srv_nodejs(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
)

### Generating Module File
_generate_module_nodejs(sick_scan
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sick_scan_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sick_scan_generate_messages sick_scan_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_nodejs _sick_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sick_scan_gennodejs)
add_dependencies(sick_scan_gennodejs sick_scan_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sick_scan_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_msg_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)

### Generating Services
_generate_srv_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_srv_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)
_generate_srv_py(sick_scan
  "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
)

### Generating Module File
_generate_module_py(sick_scan
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sick_scan_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sick_scan_generate_messages sick_scan_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/SickImu.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarObject.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderDeviceBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderMeasurementParam1Block.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderStatusBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeaderEncoderBlock.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarPreHeader.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/RadarScan.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/Encoder.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecFieldMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LFErecMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/msg/LIDoutputstateMsg.msg" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ColaMsgSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/ECRChangeArrSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/sick_scan/srv/LIDoutputstateSrv.srv" NAME_WE)
add_dependencies(sick_scan_generate_messages_py _sick_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sick_scan_genpy)
add_dependencies(sick_scan_genpy sick_scan_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sick_scan_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sick_scan
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sick_scan_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(sick_scan_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(sick_scan_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sick_scan
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sick_scan_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(sick_scan_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(sick_scan_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sick_scan
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sick_scan_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(sick_scan_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(sick_scan_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sick_scan
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sick_scan_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(sick_scan_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(sick_scan_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sick_scan
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sick_scan_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(sick_scan_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(sick_scan_generate_messages_py sensor_msgs_generate_messages_py)
endif()
