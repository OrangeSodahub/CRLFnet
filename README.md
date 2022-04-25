# Modify
## PointRCNN
1. /lib/utils/roipool3d/src/roipool3d.cpp:6 change `AT_CHECK` to `TORCH_CHECK` \\
                                         :7 change `AT_CHECK` to `TORCH_CHECK` \\
2. /pointnet_lib/pointnet/src/ball_query.cpp:10 change `AT_CHECK` to `TORCH_CHECK` \\
                                             :11 change `AT_CHECK` to `TORCH_CHECK` \\
                                             :22 change `THCState_getCurrentStream(state)` to `c10::cuda::getCurrentCUDAStream()`
