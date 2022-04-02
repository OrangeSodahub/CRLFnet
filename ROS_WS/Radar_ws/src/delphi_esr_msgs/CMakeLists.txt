cmake_minimum_required(VERSION 2.8.3)
project(delphi_esr_msgs)

add_definitions(-std=c++11)

set(CMAKE_CXX_FLAGS "-std=c++0x ${CMAKE_CXX_FLAGS}")

find_package(catkin REQUIRED COMPONENTS
    message_generation
    std_msgs
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  EsrEthTx.msg
  # can Tx
  EsrStatus1.msg
  EsrStatus2.msg
  EsrStatus3.msg
  EsrStatus4.msg
  EsrStatus5.msg
  EsrStatus6.msg
  EsrStatus7.msg
  EsrStatus8.msg
  EsrStatus9.msg
  EsrValid1.msg
  EsrValid2.msg
  EsrTrack.msg
  EsrTrackMotionPower.msg
  TrackMotionPower.msg
  # can Rx
  EsrVehicle1.msg
  EsrVehicle2.msg
  EsrVehicle3.msg
  EsrVehicle4.msg
  EsrVehicle5.msg
)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS
  message_runtime
  std_msgs
)
