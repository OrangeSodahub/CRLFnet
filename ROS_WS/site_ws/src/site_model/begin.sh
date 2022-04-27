#!/bin/bash echo "Begin!"

# launch
gnome-terminal --tab "spawn.launch" -- bash -c "cd ../../../../;roslaunch site_model spawn.launch"
echo "spawn.launch succeed."
sleep 10

{gnome-terminal --tab "racecar.launch" -- bash -c "cd ../../../../;roslaunch pkg racecar.launch"
echo "racecar.launch succeed."
sleep 10

# control
gnome-terminal --tab "racecar_control" -- bash -c "cd ../../../../;rosrun pkg keyboard_teleop.py"
echo "Controllor Set."
sleep 10

# radar
gnome-terminal --tab "radar_listener" -- bash -c "cd src/tools/;python radar_listener.py"
echo "Radar Listener Begin."
sleep 5

# camera
gnome-terminal --tab "camera_listener" -- bash -c "cd src/LidCamFusion/;python camera_listener.py"
echo "Camera Listener Begin."
sleep 5

# radar-camera fusion
gnome-terminal --tab "radar-camera fusion" -- bash -c "cd src/tools/RadCamFusion/;python fusion.py --draw_output False"
echo "Radar-Camera Fusion Begin."
sleep 5

# lidar
gnome-terminal --tab "lidar_listener" -- bash -c "cd src/LidCamFusion/;python pointcloud_listener.py"
echo "Lidar Listener Begin."
sleep 5
gnome-terminal --tab "pointcloud_combiner" -- bash -c "cd ../../../../;rosrun site_model pointcloud_combiner"
echo "pointcloud combine succeed."