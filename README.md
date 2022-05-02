# CRLFnet
The source code of the CRLFnet.
# Rad-Cam Fusion
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
 | tools/rename.py                  | 5           |
 | config.yaml                      |             |

### Problem #2: GPU Usage
If you have GPU, you should set the "cuda" to True in "tools/RadCamFusion/yolo/yolo.py". Also, if the program crashes due to GPU settings, you can try set "cuda" to False.

### Problem #3: "ros_numpy" Package
Please download and install "ros_numpy". This package is used to convert image format.

Source code:    https://github.com/eric-wieser/ros_numpy

How to install: https://blog.csdn.net/mywxm/article/details/121945880

### Problem #4: Weights
Since the trainning is not finished, the model data is temporarily from the author of the yolo code. So the result of the detection is meaningless.

### Problem #5: Model Data
If yolo can't find "coco_classes.txt", "yolo_weights.pth" or other similar files, please check whether the folder "tools/RadCamFusion/yolo/model_data" exists. If it doesn't exist, please download it from https://github.com/bubbliiiing/yolo3-pytorch


## How to run the code:
Run the following instructions in WORKSPACE in order. 
###
    source ./devel/setup.bash
    
    roslaunch site_model spawn.launch

    rosrun site_model src/tools/radar_listener.py

    rosrun site_model src/tools/RadCamFusion/fusion.py

If you run the code for the first time, maybe you have to use the command
###
    chmod +x {file name}.py
to enable the system to run certain files like "radar_listener.py".

# Lid-Cam Fusion
## Run
### Create dataset infos
File **custom_infos_train.pkl** and **custom_infos_test.pkl** will be saved to data/custom.
```python
python -m pcdet.datasets.custom.custom_dataset create_custom_infos tools/cfgs/dataset_configs/custom_dataset.yaml
```