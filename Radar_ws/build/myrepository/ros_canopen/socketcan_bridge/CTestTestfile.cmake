# CMake generated Testfile for 
# Source directory: /home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge
# Build directory: /home/zonlin/ROS/Radar_ws/build/myrepository/ros_canopen/socketcan_bridge
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_socketcan_bridge_gtest_test_conversion "/home/zonlin/ROS/Radar_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/zonlin/ROS/Radar_ws/build/test_results/socketcan_bridge/gtest-test_conversion.xml" "--return-code" "/home/zonlin/ROS/Radar_ws/devel/lib/socketcan_bridge/test_conversion --gtest_output=xml:/home/zonlin/ROS/Radar_ws/build/test_results/socketcan_bridge/gtest-test_conversion.xml")
set_tests_properties(_ctest_socketcan_bridge_gtest_test_conversion PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;222;catkin_add_gtest;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;0;")
add_test(_ctest_socketcan_bridge_rostest_test_to_socketcan.test "/home/zonlin/ROS/Radar_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/zonlin/ROS/Radar_ws/build/test_results/socketcan_bridge/rostest-test_to_socketcan.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge --package=socketcan_bridge --results-filename test_to_socketcan.xml --results-base-dir \"/home/zonlin/ROS/Radar_ws/build/test_results\" /home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/test/to_socketcan.test ")
set_tests_properties(_ctest_socketcan_bridge_rostest_test_to_socketcan.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;80;add_rostest;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;100;_add_rostest_google_test;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;232;add_rostest_gtest;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;0;")
add_test(_ctest_socketcan_bridge_rostest_test_to_topic.test "/home/zonlin/ROS/Radar_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/zonlin/ROS/Radar_ws/build/test_results/socketcan_bridge/rostest-test_to_topic.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge --package=socketcan_bridge --results-filename test_to_topic.xml --results-base-dir \"/home/zonlin/ROS/Radar_ws/build/test_results\" /home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/test/to_topic.test ")
set_tests_properties(_ctest_socketcan_bridge_rostest_test_to_topic.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;80;add_rostest;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;100;_add_rostest_google_test;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;241;add_rostest_gtest;/home/zonlin/ROS/Radar_ws/src/myrepository/ros_canopen/socketcan_bridge/CMakeLists.txt;0;")
