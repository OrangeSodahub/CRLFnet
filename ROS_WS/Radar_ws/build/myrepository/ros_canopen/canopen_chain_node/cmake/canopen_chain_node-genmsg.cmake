# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "canopen_chain_node: 0 messages, 2 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(canopen_chain_node_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_custom_target(_canopen_chain_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "canopen_chain_node" "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" ""
)

get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_custom_target(_canopen_chain_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "canopen_chain_node" "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/canopen_chain_node
)
_generate_srv_cpp(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/canopen_chain_node
)

### Generating Module File
_generate_module_cpp(canopen_chain_node
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/canopen_chain_node
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(canopen_chain_node_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(canopen_chain_node_generate_messages canopen_chain_node_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_cpp _canopen_chain_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_cpp _canopen_chain_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(canopen_chain_node_gencpp)
add_dependencies(canopen_chain_node_gencpp canopen_chain_node_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS canopen_chain_node_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/canopen_chain_node
)
_generate_srv_eus(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/canopen_chain_node
)

### Generating Module File
_generate_module_eus(canopen_chain_node
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/canopen_chain_node
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(canopen_chain_node_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(canopen_chain_node_generate_messages canopen_chain_node_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_eus _canopen_chain_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_eus _canopen_chain_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(canopen_chain_node_geneus)
add_dependencies(canopen_chain_node_geneus canopen_chain_node_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS canopen_chain_node_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/canopen_chain_node
)
_generate_srv_lisp(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/canopen_chain_node
)

### Generating Module File
_generate_module_lisp(canopen_chain_node
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/canopen_chain_node
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(canopen_chain_node_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(canopen_chain_node_generate_messages canopen_chain_node_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_lisp _canopen_chain_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_lisp _canopen_chain_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(canopen_chain_node_genlisp)
add_dependencies(canopen_chain_node_genlisp canopen_chain_node_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS canopen_chain_node_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/canopen_chain_node
)
_generate_srv_nodejs(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/canopen_chain_node
)

### Generating Module File
_generate_module_nodejs(canopen_chain_node
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/canopen_chain_node
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(canopen_chain_node_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(canopen_chain_node_generate_messages canopen_chain_node_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_nodejs _canopen_chain_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_nodejs _canopen_chain_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(canopen_chain_node_gennodejs)
add_dependencies(canopen_chain_node_gennodejs canopen_chain_node_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS canopen_chain_node_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node
)
_generate_srv_py(canopen_chain_node
  "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node
)

### Generating Module File
_generate_module_py(canopen_chain_node
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(canopen_chain_node_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(canopen_chain_node_generate_messages canopen_chain_node_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/GetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_py _canopen_chain_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/canopen_chain_node/srv/SetObject.srv" NAME_WE)
add_dependencies(canopen_chain_node_generate_messages_py _canopen_chain_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(canopen_chain_node_genpy)
add_dependencies(canopen_chain_node_genpy canopen_chain_node_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS canopen_chain_node_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/canopen_chain_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/canopen_chain_node
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/canopen_chain_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/canopen_chain_node
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/canopen_chain_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/canopen_chain_node
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/canopen_chain_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/canopen_chain_node
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/canopen_chain_node
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
