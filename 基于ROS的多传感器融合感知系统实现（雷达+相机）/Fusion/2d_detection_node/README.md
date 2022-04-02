## Dependency setup:

Anaconda is recommended for easy dependency management
( https://www.anaconda.com/distribution/ )

```bash
conda pilotA create -f environment.yml
conda activate pilotA
```

## Weights:

The keras weights for the model are 250MB and can't be uploaded to github.
Weight download is available from:

https://drive.google.com/open?id=1qWRBc6ZNPzw3hMCyFnI_H219EMa2MlaD


Weight file has to be placed in 

```bash
mercedes-clk-perception/2d_detection_node/mask_rcnn_coco.h5
```

## Deployment

```
python3 inference_ros.py
```

## Usage:
The node subscribes to images on topic: ```/zed_node/left/image_rect_color```
The node publishes inference results on topic: ```/2d_node/results``` 
