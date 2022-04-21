#run roscore and then run the following instructions:
# (run in separate terminals because otherwise it's hard to catch errors)

# for hardware
# roscore &
# roslaunch zed_wrapper zed_camera.launch &
# rosrun nmea_navsat_driver nmea_serial_driver _port:=/dev/ttyACM2 _baud:=115200 &
# roslaunch ti_mmwave_rospkg 1642es2_short_range.launch

#for transform between radar and camera
#rosrun tf static_transform_publisher 0 0 0 0 0 0 ti_mmwave base_link 50

#for rosbridge
#roslaunch rosbridge_server rosbridge_websocket.launch

roscore &

sleep 5; rosrun tf static_transform_publisher 0 0 0 0 0 0 ti_mmwave map 50 &
sleep 5; python3 radar_node/main.py &


