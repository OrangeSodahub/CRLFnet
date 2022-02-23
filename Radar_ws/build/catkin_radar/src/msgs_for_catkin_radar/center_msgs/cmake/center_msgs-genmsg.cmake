# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "center_msgs: 11 messages, 0 services")

set(MSG_I_FLAGS "-Icenter_msgs:/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(center_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" "geometry_msgs/Point:std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Transform:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" "geometry_msgs/Point:std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_custom_target(_center_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "center_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)
_generate_msg_cpp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(center_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(center_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(center_msgs_generate_messages center_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_cpp _center_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(center_msgs_gencpp)
add_dependencies(center_msgs_gencpp center_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS center_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)
_generate_msg_eus(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(center_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(center_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(center_msgs_generate_messages center_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_eus _center_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(center_msgs_geneus)
add_dependencies(center_msgs_geneus center_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS center_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)
_generate_msg_lisp(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(center_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(center_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(center_msgs_generate_messages center_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_lisp _center_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(center_msgs_genlisp)
add_dependencies(center_msgs_genlisp center_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS center_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)
_generate_msg_nodejs(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(center_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(center_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(center_msgs_generate_messages center_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_nodejs _center_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(center_msgs_gennodejs)
add_dependencies(center_msgs_gennodejs center_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS center_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)
_generate_msg_py(center_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(center_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(center_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(center_msgs_generate_messages center_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/Ack.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/GlobalPath.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckPose.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TosTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/TruckArrived.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleTarget.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/CalibrateSwitch.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/DestPoint.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/VehicleStopAccurate.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/ExternalCenterCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs_for_catkin_radar/center_msgs/msg/PlcStopCmd.msg" NAME_WE)
add_dependencies(center_msgs_generate_messages_py _center_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(center_msgs_genpy)
add_dependencies(center_msgs_genpy center_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS center_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/center_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(center_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(center_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/center_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(center_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(center_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/center_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(center_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(center_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/center_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(center_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(center_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/center_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(center_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(center_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
