# Install script for directory: /home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zonlin/桌面/ROS_WS/Radar_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pb_msgs/msg" TYPE FILE FILES
    "/home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs/msg/ContiRadar.msg"
    "/home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs/msg/ContiList.msg"
    "/home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs/msg/ClusterRadar.msg"
    "/home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs/msg/ClusterList.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pb_msgs/cmake" TYPE FILE FILES "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/pb_msgs/catkin_generated/installspace/pb_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/include/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/share/roseus/ros/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/share/common-lisp/ros/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/share/gennodejs/ros/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/lib/python3/dist-packages/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/devel/lib/python3/dist-packages/pb_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/pb_msgs/catkin_generated/installspace/pb_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pb_msgs/cmake" TYPE FILE FILES "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/pb_msgs/catkin_generated/installspace/pb_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pb_msgs/cmake" TYPE FILE FILES
    "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/pb_msgs/catkin_generated/installspace/pb_msgsConfig.cmake"
    "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/pb_msgs/catkin_generated/installspace/pb_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pb_msgs" TYPE FILE FILES "/home/zonlin/桌面/ROS_WS/Radar_ws/src/myrepository/ros_canopen/pb_msgs/package.xml")
endif()

