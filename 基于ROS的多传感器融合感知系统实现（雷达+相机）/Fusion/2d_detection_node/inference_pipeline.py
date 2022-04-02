import os
import time
import numpy as np
import skvideo.io
from coco import coco
from mrcnn import visualize2
import mrcnn



INPUT_VIDEO_PATH = os.path.abspath('videos/raw/SanJoseBike.mp4')
OUTPUT_VIDEO_PATH = os.path.abspath('videos/processed/SanJoseBike.mp4')

COCO_WEIGHTS_PATH = os.path.abspath('mask_rcnn_coco.h5')
LOGS_DIR = os.path.abspath('logs')

BATCH_SIZE = 1

class InferenceConfig(coco.CocoConfig):
    # Set batch size to 1 since we'll be running inference on
    # one image at a time. Batch size = GPU_COUNT * IMAGES_PER_GPU
    GPU_COUNT = 1
    IMAGES_PER_GPU = BATCH_SIZE

config = InferenceConfig()

# Create model object in inference mode.
model = mrcnn.model.MaskRCNN(mode="inference", model_dir=LOGS_DIR, config=config)

# Load weights trained on MS-COCO
model.load_weights(COCO_WEIGHTS_PATH, by_name=True)


class_names = ['BG', 'person', 'bicycle', 'car', 'motorcycle', 'airplane',
               'bus', 'train', 'truck', 'boat', 'traffic light',
               'fire hydrant', 'stop sign', 'parking meter', 'bench', 'bird',
               'cat', 'dog', 'horse', 'sheep', 'cow', 'elephant', 'bear',
               'zebra', 'giraffe', 'backpack', 'umbrella', 'handbag', 'tie',
               'suitcase', 'frisbee', 'skis', 'snowboard', 'sports ball',
               'kite', 'baseball bat', 'baseball glove', 'skateboard',
               'surfboard', 'tennis racket', 'bottle', 'wine glass', 'cup',
               'fork', 'knife', 'spoon', 'bowl', 'banana', 'apple',
               'sandwich', 'orange', 'broccoli', 'carrot', 'hot dog', 'pizza',
               'donut', 'cake', 'chair', 'couch', 'potted plant', 'bed',
               'dining table', 'toilet', 'tv', 'laptop', 'mouse', 'remote',
               'keyboard', 'cell phone', 'microwave', 'oven', 'toaster',
               'sink', 'refrigerator', 'book', 'clock', 'vase', 'scissors',
               'teddy bear', 'hair drier', 'toothbrush']

videogen = skvideo.io.vreader(INPUT_VIDEO_PATH)
writer = skvideo.io.FFmpegWriter(OUTPUT_VIDEO_PATH)

frames = []

use_numpy_buffer = False

i=0
for frame in videogen:
    
    i+=1
    if i > 6000 or i < 3000: continue

    print(i)
    
    
    results = model.detect([frame], verbose=False)
    
    r = results[0]
                            
    frame = visualize2.get_instances_image(frame, r['rois'], r['masks'], r['class_ids'], 
                                class_names, r['scores'])
    

    frame = frame.astype(np.uint8)
    
    if use_numpy_buffer == True:
        frames.append(frame)
    else:
        writer.writeFrame(frame)

if use_numpy_buffer == True:
    skvideo.io.vwrite(OUTPUT_VIDEO_PATH, frames)
else:
    writer.close()
