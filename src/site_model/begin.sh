#!/bin/bash echo "Begin!"

# launch
gnome-terminal --tab "spawn.launch" -- bash -c "cd ../../../../;roslaunch site_model spawn.launch"
echo "spawn.launch succeed."
sleep 30

# preperation
gnome-terminal --tab "preparation" --bash -c "cd ../../../../;rosrun site_model get_cam_info"
sleep 5
echo "Camera Info received."

# generate calibration
gnome-terminal --tab "calibration" --bash -c "cd src/tools/RadCamFusion/;python generate_calib.py"
sleep 5
echo "Calibration Generated."

# radar
gnome-terminal --tab "radar_listener" -- bash -c "cd src/tools/;python radar_listener.py"
echo "Radar Listener Begin."
sleep 5

# radar-camera fusion
gnome-terminal --tab "radar-camera fusion" -- bash -c "cd src/tools/RadCamFusion/;python fusion.py --draw_output False"
echo "Radar-Camera Fusion Begin."
sleep 5

# camera
gnome-terminal --tab "camera_listener" -- bash -c "cd src/LidCamFusion/;python camera_listener.py"
echo "Camera Listener Begin."
sleep 5

# lidar
gnome-terminal --tab "lidar_listener" -- bash -c "cd src/LidCamFusion/;python pointcloud_listener.py"
echo "Lidar Listener Begin."
sleep 5
gnome-terminal --tab "pointcloud_combiner" -- bash -c "cd ../../../../;rosrun site_model pointcloud_combiner"
echo "Pointcloud Combine Begin."
sleep 5

# lidar-camera fusion
gnome-terminal --tab "lidar-camera fusion" -- bash -c "cd src/LidCamFusion/;python fusion.py"
echo "Lidar-Camera Fusion Begin."

# agents
gnome-terminal --tab "agent" -- bash -c "cd src/agent/;python agent1.py"
echo "Agent1 Set."

# convert rosbag to txt
# rostopic echo -b file_name.bag -p /topic_name > Txt_name.txt