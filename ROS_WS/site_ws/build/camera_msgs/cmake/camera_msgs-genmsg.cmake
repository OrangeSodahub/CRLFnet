# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "camera_msgs: 2 messages, 0 services")

set(MSG_I_FLAGS "-Icamera_msgs:/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(camera_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_custom_target(_camera_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera_msgs" "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_custom_target(_camera_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera_msgs" "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" "camera_msgs/MsgObject:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera_msgs
)
_generate_msg_cpp(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(camera_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(camera_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(camera_msgs_generate_messages camera_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_cpp _camera_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_cpp _camera_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_msgs_gencpp)
add_dependencies(camera_msgs_gencpp camera_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera_msgs
)
_generate_msg_eus(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(camera_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(camera_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(camera_msgs_generate_messages camera_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_eus _camera_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_eus _camera_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_msgs_geneus)
add_dependencies(camera_msgs_geneus camera_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera_msgs
)
_generate_msg_lisp(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(camera_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(camera_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(camera_msgs_generate_messages camera_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_lisp _camera_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_lisp _camera_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_msgs_genlisp)
add_dependencies(camera_msgs_genlisp camera_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera_msgs
)
_generate_msg_nodejs(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(camera_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(camera_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(camera_msgs_generate_messages camera_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_nodejs _camera_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_nodejs _camera_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_msgs_gennodejs)
add_dependencies(camera_msgs_gennodejs camera_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs
)
_generate_msg_py(camera_msgs
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg"
  "${MSG_I_FLAGS}"
  "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(camera_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(camera_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(camera_msgs_generate_messages camera_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgObject.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_py _camera_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/camera_msgs/msg/MsgCamera.msg" NAME_WE)
add_dependencies(camera_msgs_generate_messages_py _camera_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_msgs_genpy)
add_dependencies(camera_msgs_genpy camera_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(camera_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(camera_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(camera_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(camera_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(camera_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(camera_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(camera_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(camera_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs)
  install(CODE "execute_process(COMMAND \"/usr/local/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(camera_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(camera_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
