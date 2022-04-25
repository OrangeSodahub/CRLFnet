## Modify
### PointRCNN
1. /lib/utils/roipool3d/src/roipool3d.cpp:
```
6 | AT_CHECK ===> TORCH_CHECK
7 | AT_CHECK ===> TORCH_CHECK
```
2. /pointnet_lib/pointnet/src/ball_query.cpp
```
10 | AT_CHECK ===> TORCH_CHECK
11 | AT_CHECK ===> TORCH_CHECK
22 | THCState_getCurrentStream(state) ===> c10::cuda::getCurrentCUDAStream()
```
3. /lib/config.py
```
187 | yaml.load(f) ===> yaml.load(f, Loader=yaml.FullLoader)
```
4. /tools/train_rcnn.py
```
36 | default='gt_database/train_gt_database_3level_Car.pkl' ===> default='gt_database/train_gt_database_3level_vehicle.pkl'
```