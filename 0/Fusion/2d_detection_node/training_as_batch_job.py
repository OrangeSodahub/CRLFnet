import os
import sys
import time
import numpy as np
import imgaug

#mrcnn code
from mrcnn.config import Config
from mrcnn import model as modellib, utils

#coco tools
from pycocotools.coco import COCO
from pycocotools.cocoeval import COCOeval
from pycocotools import mask as maskUtils
from coco.coco import CocoDataset


COCO_PRETRAINED_WEIGHTS_PATH = os.path.abspath("mask_rcnn_coco.h5")
DATASET_PATH = os.path.abspath("DATASETS/")
TRAIN_ANNOTATIONS_PATH = os.path.abspath("DATASETS/annotations/instances_train2017.json")
LOGS_PATH = os.path.abspath("LOGS")

class CocoConfig(Config):
    """Configuration for training on MS COCO.
    Derives from the base Config class and overrides values specific
    to the COCO dataset.
    """
    # Give the configuration a recognizable name
    NAME = "coco"
    
    #IMAGES_PER_GPU = 1 #Only one image fits on my 6GB GTX1060. 
    IMAGES_PER_GPU = 2 #version for Tesla P100
    
    NUM_CLASSES = 1 + 80  #80 COCO classes + BG class


coco_train_annotatons = COCO(TRAIN_ANNOTATIONS_PATH)

# Training dataset
dataset_train = CocoDataset()
dataset_train.load_coco(dataset_dir=DATASET_PATH, subset="train", year=2017, class_ids=None,
                        class_map=None, return_coco=False, auto_download=False)
dataset_train.prepare()

# Validation dataset
dataset_val = CocoDataset()
dataset_val.load_coco(dataset_dir=DATASET_PATH, subset="val", year=2017, auto_download=False)
dataset_val.prepare()


augmentation = imgaug.augmenters.Fliplr(0.5)

config = CocoConfig()
config.LEARNING_RATE = 0.001
config.LEARNING_MOMENTUM = 0.9
config.WEIGHT_DECAY = 0.0001 # Weight decay regularization

# Create model
model = modellib.MaskRCNN(mode="training", config=config,
                          model_dir=LOGS_PATH)

# Training - Stage 1
print("Training network heads")
hist_stage_1 = model.train(dataset_train, dataset_val,
            learning_rate=config.LEARNING_RATE,
            epochs=20,
            layers='heads',
            augmentation=augmentation)

# Training - Stage 2
# Finetune layers from ResNet stage 4 and up
print("Fine tune Resnet stage 4 and up")
hist_stage_2 = model.train(dataset_train, dataset_val,
            learning_rate=config.LEARNING_RATE,
            epochs=80,
            layers='4+',
            augmentation=augmentation)

# Training - Stage 3
# Fine tune all layers
print("Fine tune all layers")
hist_stage_3 = model.train(dataset_train, dataset_val,
            learning_rate=config.LEARNING_RATE / 10,
            epochs=20,
            layers='all',
            augmentation=augmentation)
