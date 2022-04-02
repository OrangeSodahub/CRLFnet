import os
import time
import numpy as np
import skvideo.io
from coco import coco
from mrcnn import visualize2
import mrcnn
import jsonpickle


import rospy 
from sensor_msgs.msg import Image as ROS_Image
from rospy.numpy_msg import numpy_msg
from std_msgs.msg import Int32MultiArray, String
import time
from PIL import Image as PIL_Image
import numpy as np
import matplotlib.pyplot as plt
from cv_bridge import CvBridge


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
model.keras_model._make_predict_function()

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


def inference(frame):
    
    print("@", time.time(), "Inference on image of shape ", frame.shape)

    results = model.detect([frame], verbose=False)
    
    r = results[0]

    frame = visualize2.get_instances_image(frame, r['rois'], r['masks'], r['class_ids'], 
                                class_names, r['scores'])

    frame = frame.astype(np.uint8)

    return (results, frame)


def vis_callback(data):

    img = np.frombuffer(data.data, dtype=np.uint8).reshape(data.height, data.width, 4)

    #fixing bgr
    img = img[:,:,0:3]
    img = img[...,::-1]

    results, outimg = inference(img)
    outmsg = ROS_Image()
    outmsg.data = outimg.tostring()
    outmsg.encoding = "bgr8"
    outmsg.header.stamp = rospy.Time.now()

    # outimg = PIL_Image.fromarray(out, 'RGB')
    # outimg.show()

    image_pub.publish(outmsg)
    results_pub.publish(jsonpickle.encode(results))

    #show or save here
    #oimg = PIL_Image.fromarray(outimg, 'RGB')
    #oimg.show()
    #oimg.save("/home/tomek/mercedes-clk-perception/images/loop2_precise/{}.jpg".format(int(time.time())))

    pub_rate.sleep()
    # time.sleep(1)

if __name__ == '__main__':
    rospy.init_node('image_reader', anonymous=True)
    image_sub = rospy.Subscriber("/zed_node/left/image_rect_color", numpy_msg(ROS_Image), vis_callback)

    image_pub = rospy.Publisher("/2d_node/output_image", ROS_Image, queue_size=10)
    results_pub = rospy.Publisher("/2d_node/results", String, queue_size=10)
    pub_rate = rospy.Rate(1.5) #1Hz
    rospy.spin()