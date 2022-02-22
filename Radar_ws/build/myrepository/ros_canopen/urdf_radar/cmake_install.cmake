# Install script for directory: /home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/urdf_radar

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zonlin/ROS/Radar_ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/urdf_radar/catkin_generated/installspace/urdf_radar.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_radar/cmake" TYPE FILE FILES
    "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/urdf_radar/catkin_generated/installspace/urdf_radarConfig.cmake"
    "/home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/urdf_radar/catkin_generated/installspace/urdf_radarConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_radar" TYPE FILE FILES "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/urdf_radar/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_radar" TYPE DIRECTORY FILES
    "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/urdf_radar/launch"
    "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/urdf_radar/rviz"
    "/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/urdf_radar/urdf"
    )
endif()

