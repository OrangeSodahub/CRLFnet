# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "conti_radar_msgs: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iconti_radar_msgs:/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(conti_radar_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_custom_target(_conti_radar_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "conti_radar_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" "std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_custom_target(_conti_radar_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "conti_radar_msgs" "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" "std_msgs/Header:geometry_msgs/Point:conti_radar_msgs/conti_Object"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/conti_radar_msgs
)
_generate_msg_cpp(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/conti_radar_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(conti_radar_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/conti_radar_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(conti_radar_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(conti_radar_msgs_generate_messages conti_radar_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_cpp _conti_radar_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_cpp _conti_radar_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(conti_radar_msgs_gencpp)
add_dependencies(conti_radar_msgs_gencpp conti_radar_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS conti_radar_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/conti_radar_msgs
)
_generate_msg_eus(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/conti_radar_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(conti_radar_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/conti_radar_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(conti_radar_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(conti_radar_msgs_generate_messages conti_radar_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_eus _conti_radar_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_eus _conti_radar_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(conti_radar_msgs_geneus)
add_dependencies(conti_radar_msgs_geneus conti_radar_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS conti_radar_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/conti_radar_msgs
)
_generate_msg_lisp(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/conti_radar_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(conti_radar_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/conti_radar_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(conti_radar_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(conti_radar_msgs_generate_messages conti_radar_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_lisp _conti_radar_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_lisp _conti_radar_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(conti_radar_msgs_genlisp)
add_dependencies(conti_radar_msgs_genlisp conti_radar_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS conti_radar_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/conti_radar_msgs
)
_generate_msg_nodejs(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/conti_radar_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(conti_radar_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/conti_radar_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(conti_radar_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(conti_radar_msgs_generate_messages conti_radar_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_nodejs _conti_radar_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_nodejs _conti_radar_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(conti_radar_msgs_gennodejs)
add_dependencies(conti_radar_msgs_gennodejs conti_radar_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS conti_radar_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs
)
_generate_msg_py(conti_radar_msgs
  "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(conti_radar_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(conti_radar_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(conti_radar_msgs_generate_messages conti_radar_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Object.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_py _conti_radar_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/catkin_radar/src/msgs/conti_radar_msgs/msg/conti_Objects.msg" NAME_WE)
add_dependencies(conti_radar_msgs_generate_messages_py _conti_radar_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(conti_radar_msgs_genpy)
add_dependencies(conti_radar_msgs_genpy conti_radar_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS conti_radar_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/conti_radar_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/conti_radar_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(conti_radar_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(conti_radar_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/conti_radar_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/conti_radar_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(conti_radar_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(conti_radar_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/conti_radar_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/conti_radar_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(conti_radar_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(conti_radar_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/conti_radar_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/conti_radar_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(conti_radar_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(conti_radar_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/conti_radar_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(conti_radar_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(conti_radar_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
