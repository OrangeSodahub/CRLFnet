#!/usr/bin/env python3

"""
Convert raw images to regions of interest (ROIs).
"""


from PIL import Image
import ros_numpy

from yolo.yolo import YOLO


def image_roi(image, yolo=None):
    if not isinstance(yolo, YOLO):
        raise ValueError("\033[0;31mNo available YOLO object.\033[0m")
    # convert image format
    image = ros_numpy.numpify(image)
    image = Image.fromarray(image)
    # detect image
    return yolo.detect_img(image)
