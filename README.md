
# CRLFnet
[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)
[![CodeQL](https://github.com/OrangeSodahub/CRLFnet/actions/workflows/codeql.yml/badge.svg)](https://github.com/OrangeSodahub/CRLFnet/actions/workflows/codeql.yml)
[![pages-build-deployment](https://github.com/OrangeSodahub/CRLFnet/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/OrangeSodahub/CRLFnet/actions/workflows/pages/pages-build-deployment)
<!--[![Test Coverage](https://api.codeclimate.com/v1/badges/0859d98473647f42d498/test_coverage)](https://codeclimate.com/github/OrangeSodahub/CRLFnet/test_coverage)-->
<!--[![Maintainability](https://api.codeclimate.com/v1/badges/0859d98473647f42d498/maintainability)](https://codeclimate.com/github/OrangeSodahub/CRLFnet/maintainability)-->
[![Codecov](https://codecov.io/gh/OrangeSodahub/CRLFnet/branch/master/graph/badge.svg)](https://codecov.io/gh/OrangeSodahub/CRLFnet)
![GitHub](https://img.shields.io/github/license/OrangeSodahub/CRLFnet)
![GitHub top language](https://img.shields.io/github/languages/top/OrangeSodahub/CRLFnet)
![GitHub last commit](https://img.shields.io/github/last-commit/OrangeSodahub/CRLFnet)
[![DOI](https://zenodo.org/badge/477069057.svg)](https://zenodo.org/badge/latestdoi/477069057)

The source code of the CRLFnet.

## INSTALL & BUILD

**Env:** Ubuntu20.04 + ROS(Noetic) + Python3.x

**Notice:** 
- If using Google-colab, there is a recommanded environment: **CUDA10.2+PyTorch1.6**. It is proved that **CUDA11.3+PyTorch1.11** is incorrect.
- Build the `pcdet` using correct version of CUDA, when a build process occurred errors , before change the version of CUDA and the next build **Delete** the entire `build` folder.

# Rad-Cam Fusion
## Preparation:

### #1 Absolute Paths
Notice that absolute paths may conflict with yours. Some of the absolute paths are listed as follows.
 | file path                        | Line(s)                               |
 |----------------------------------|---------------------------------------|
 | src/camera_info/get_cam_info.cpp | 26,64,102,140,170,216,254,292,330,368,|
 | tools/RadCamFusion/yolo/yolo.py  | 28, 29, 34                            |
 | tools/rename.py                  | 5                                     |

### #2 GPU Usage
If you are using GPU, you should set the `cuda` to `True` in **tools/RadCamFusion/yolo/yolo.py**". Also, if the program crashes due to GPU settings, try to set `cuda` to `False`.

### #3 "ros_numpy" Package
Please download and install "ros_numpy". This package is used to convert image format.

Source code:    https://github.com/eric-wieser/ros_numpy

How to install: https://blog.csdn.net/mywxm/article/details/121945880

### #4 Weights
New trained Custom Model: https://drive.google.com/file/d/1-cMNDnujVCtvtDKlq9kGuJAk0jpeXUb4/view?usp=sharing

### #5: Model Data
If yolo can't find "coco_classes.txt", "yolo_weights.pth" or other similar files, please check whether the folder "tools/RadCamFusion/yolo/model_data" exists. If it doesn't exist, please download it from https://github.com/bubbliiiing/yolo3-pytorch

## Run:
Run the following instructions in **ROOT_PATH** in order. 
###
    source ./devel/setup.bash
    
    roslaunch site_model spawn.launch

    rosrun site_model src/tools/radar_listener.py

    rosrun site_model src/tools/RadCamFusion/fusion.py

If you run the code for the first time, maybe you have to use the command to enable the system to run certain files like "radar_listener.py".
###
    chmod +x {file name}.py

# Lid-Cam Fusion
Config files:

tools/cfgs/custom_models/pv_rcnn.yaml：Model configs

tools/cfgs/dataset_configs/custom_dataset.yaml：Dataset configs

## Datasets

## Run
### Create dataset infos
File **custom_infos_train.pkl** and **custom_infos_test.pkl** will be saved to data/custom.
```bash
python -m pcdet.datasets.custom.custom_dataset create_custom_infos tools/cfgs/dataset_configs/custom_dataset.yaml
```
### Train
```bash
cd tools/
python train.py --cfg_file cfgs/custom_models/pv_rcnn.yaml --batch_size 2 --workers 4 --epochs 20
```
Two models **PV-RCNN**, **PointRCNN** are supported now.

### Predict
```bash
python pred.py --cfg_file path/to/config/file/ --ckpt path/to/checkpoint/ --data_path path/to/dataset/
```
For example:
```bash
python demo.py --cfg_file cfgs/custom_models/pv_rcnn.yaml --ckpt ../output/custom_models/pv_rcnn/default/ckpt/checkpoint_epoch_20.pth --data_path ../data/custom/testing/velodyne/
```

# Run the whole model
The whole project contains several different parts which need to be start up through commands. Following commands show how to start. Their order is immutable.
```bash

cd /to/ROOT/DIR/; roslaunch site_model spawn.launch # start roscore and build the solid model
rosrun site_model get_cam_info # get relevant parameters of cameras
python src/site_model/src/tools/RadCamFusion/generate_calib.py # generate calibration formula according to parameters of cameras
python src/site_model/src/tools/radar_listener.py # radars start working
python src/site_model/src/tools/RadCamFusion/fusion.py --draw_output True/False # start camera-radar fusion
python src/site_model/src/LidCamFusion/camera_listener.py # cameras around lidars start working
python src/site_model/src/LidCamFusion/pointcloud_listener.py # lidars start working
rosrun site_model pointcloud_combiner # combine all the point clouds and fix their coords
cd src/site_model/src/LidCamFusion/; python fusion.py # start camera-lidar fusion
cd ../agent/; python agent1.py # agent1 start working
```

# Issues
Some problems may occurred during debugging.
- Confused: set the batch_size=1 and still out of memory: https://github.com/open-mmlab/OpenPCDet/issues/140
- 段错误(核心已转储) when run dem.py: https://github.com/open-mmlab/OpenPCDet/issues/846
- N > 0 assert faild. CUDA kernel launch blocks must be positive, but got N= 0 when training: https://github.com/open-mmlab/OpenPCDet/issues/945
- raise NotImplementedError, NaN or Inf found in input tensor when training: https://github.com/open-mmlab/OpenPCDet/issues/280
