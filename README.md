# CRLFnet
Source code

## Some Common Problems:
Please read carefully if you want to run the code!

### Problem #1: Absolute Paths
Some of the absolute paths are listed as follows.
 | file path                        | Line(s)     |
 |----------------------------------|-------------|
 | tools/RadCamFusion/fusion.py     | 153         |
 | LidCamFusion/fusion.py           | 25          |
 | agent/agent1.py                  | 18          |
 | tools/RadCamFusion/yolo/yolo.py  | 28, 29, 34  |
 | config.yaml                      |             |

### Problem #2: GPU Usage
If you have GPU, you should set the "cuda" to True in "tools/RadCamFusion/yolo/yolo.py". Also, if the program crashes due to GPU settings, you can try set "cuda" to False.

### Problem #3: "ros_numpy" Package
Please download and install "ros_numpy". This package is used to convert image format.

Source code:    https://github.com/eric-wieser/ros_numpy

How to install: https://blog.csdn.net/mywxm/article/details/121945880

### Problem #4: Weights
Since the trainning is not finished, the model data is temporarily from the author of the yolo code. So the result of the detection is meaningless.


## How to run the code:
Run the following instructions in WORKSPACE in order.
###
    source ./devel/setup.bash
    
    roslaunch site_model spawn.launch

    rosrun site_model src/tools/radar_listener.py

    rosrun site_model src/tools/RadCamFusion/fusion.py
