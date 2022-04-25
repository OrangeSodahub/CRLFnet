# Modify
## PointRCNN
1. /lib/utils/roipool3d/src/roipool3d.cpp:6 change `AT_CHECK` to `TORCH_CHECK` \par
                                         :7 change `AT_CHECK` to `TORCH_CHECK` \par
2. /pointnet_lib/pointnet/src/ball_query.cpp:10 change `AT_CHECK` to `TORCH_CHECK` \par
                                             :11 change `AT_CHECK` to `TORCH_CHECK` \par
                                             :22 change `THCState_getCurrentStream(state)` to `c10::cuda::getCurrentCUDAStream()`
