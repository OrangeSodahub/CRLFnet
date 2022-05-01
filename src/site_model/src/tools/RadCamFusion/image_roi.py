#!/usr/bin/env python3


from PIL import Image

import ros_numpy

from yolo.yolo import YOLO


def image_roi(image, yolo=None):
    # if the yolo is not initialized, it automatically creates a yolo
    if yolo == None:
        yolo = YOLO()
        print("A new YOLO object has been created!")
    # convert image format
    image = ros_numpy.numpify(image)
    image = Image.fromarray(image)
    # detect image
    return yolo.detect_img(image)


if __name__ == "__main__":

    yolo = YOLO()
    #-------------------------------------------------------------------------#
    #   crop                指定了是否在单张图片预测后对目标进行截取
    #   count               指定了是否进行目标的计数
    #-------------------------------------------------------------------------#
    crop            = False
    count           = False

    while True:
        img = input('Input image filename:')
        try:
            image = Image.open(img)
        except:
            print('Open Error! Try again!')
            continue
        else:
            r_image = yolo.detect_image(image, crop = crop, count=count)
            r_image.show()
