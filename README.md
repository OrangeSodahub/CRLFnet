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

- If using Google-colab, there is a recommanded environment: **CUDA10.2+PyTorch1.6**. It is proved that **CUDA11.3+PyTorch1.11** is incorrect.
- Please refer to [INSTALL.md](docs/INSTALL.md) for the installation of `OpenPCDet`. Using correct version of CUDA, when a build process occurred errors , before change the version of CUDA and the next build **Delete** the entire `build` folder.
- Install `ros_numpy` package mannually. Source code:    https://github.com/eric-wieser/ros_numpy. How to install: https://blog.csdn.net/mywxm/article/details/121945880

Absolute paths may need your mind:
 | file path                        | Line(s)                               |
 |----------------------------------|---------------------------------------|
 | src/camera_info/get_cam_info.cpp | 26,64,102,140,170,216,254,292,330,368,|
 | tools/RadCamFusion/yolo/yolo.py  | 28, 29, 34                            |
 | tools/rename.py                  | 5                                     |

## Rad-Cam Fusion

### GPU Usage
If using GPU, set the `cuda` to `True` in **tools/RadCamFusion/yolo/yolo.py**".

### Model Data
Please download "yolo_weights.pth" from `jbox`, and put it in the folder "src/site_model/src/tools/RadCamFusion/yolo/model_data".

### Rad-Cam Fusion
Follow these steps for only radar-camera fusion. For the last command, set `--draw_output` to `True` if need to save the results of fusion in the form of `.jpg`.

```bash
    cd to/ROOT_DIR/

    source devel/setup.bash
    
    roslaunch site_model spawn.launch # start the solid model

    # (generate camera calibrations if needed)

    rosrun site_model src/tools/radar_listener.py # radar msgs preprocess
    
    cd src/site_model/src/tools/RadCamFusion

    python fusion.py --draw_output True/False # radar-camera fusion start working
```

If you run the code for the first time, maybe you have to use the command to enable the system to run certain files like "radar_listener.py".

```bash
    chmod +x {file name}.py
```
### Camera Calibration
Two commands are needed for camera calibration after `spawn.launch` is launched. Relative files are already exist in the repository. If the poses of components of models in `.urdf` files haven't been modified, skip this step.

```bash
rosrun site_model get_cam_info # get relevant parameters of cameras from gazebo

python src/site_model/src/tools/RadCamFusion/generate_calib.py # generate calibration formula according to parameters of cameras
```

## Lid-Cam Fusion
### Config Files
Configurations for model and dataset need to be specified:
- **Model Configs** `tools/cfgs/custom_models/XXX.yaml`
- **Dataset Configs** `tools/cfgs/dataset_configs/custom_dataset.yaml`

Now `pointrcnn.yaml` and `pv_rcnn.yaml` are supported.

### Datasets
Create dataset infos before training:
```bash
cd OpenPCDet/
python -m pcdet.datasets.custom.custom_dataset create_custom_infos tools/cfgs/dataset_configs/custom_dataset.yaml
```
File `custom_infos_train.pkl`, `custom_dbinfos_train.pkl` and `custom_infos_test.pkl` will be saved to `data/custom`.

### Train
Specify the model using YAML files defined above.
```bash
cd tools/
python train.py --cfg_file path/to/config/file/
```
For example, if using PV_RCNN for training:
```bash
cd tools/
python train.py --cfg_file cfgs/custom_models/pv_rcnn.yaml --batch_size 2 --workers 4 --epochs 80
```

### Predict (Local)
Prediction on local dataset help to check the result of training.
```bash
python pred.py --cfg_file path/to/config/file/ --ckpt path/to/checkpoint/ --data_path path/to/dataset/
```
For example:
```bash
python demo.py --cfg_file cfgs/custom_models/pv_rcnn.yaml --ckpt ../output/custom_models/pv_rcnn/default/ckpt/checkpoint_epoch_80.pth --data_path ../data/custom/testing/velodyne/
```

### Lid-Cam Fusion
Follow these steps for only lidar-camera fusion. Some of them need different bash terminals.
```bash
    cd to/ROOT_DIR/

    roslaunch site_model spawn.launch # start the solid model

    # (generate camera calibrations if needed)

    python src/site_model/src/LidCamFusion/camera_listener.py # cameras around lidars start working

    python src/site_model/src/LidCamFusion/pointcloud_listener.py # lidars start working

    rosrun site_model pointcloud_combiner # combine all the point clouds and fix their coords

    cd src/site_model/src/LidCamFusion/;
    python fusion.py # start camera-lidar fusion
```

## Run the whole model
The whole project contains several different parts which need to be start up through commands. Following commands show how to start.
```bash
    cd to/ROOT_DIR/

    source ./devel/setup.bash
    
    roslaunch site_model spawn.launch

    # (generate camera calibrations if needed)

    rosrun site_model src/tools/radar_listener.py
    
    cd src/tools/RadCamFusion
    python fusion.py --draw_output True/False


    python src/site_model/src/LidCamFusion/camera_listener.py

    python src/site_model/src/LidCamFusion/pointcloud_listener.py

    rosrun site_model pointcloud_combiner

    cd src/site_model/src/LidCamFusion/;
    python fusion.py
```

# Issues
Some problems may occurred during debugging.
- Confused: set the batch_size=1 and still out of memory: https://github.com/open-mmlab/OpenPCDet/issues/140
- 段错误(核心已转储) when run dem.py: https://github.com/open-mmlab/OpenPCDet/issues/846
- N > 0 assert faild. CUDA kernel launch blocks must be positive, but got N= 0 when training: https://github.com/open-mmlab/OpenPCDet/issues/945
- raise NotImplementedError, NaN or Inf found in input tensor when training: https://github.com/open-mmlab/OpenPCDet/issues/280
