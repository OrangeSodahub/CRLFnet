import numpy as np
import rospy 
from sensor_msgs.msg import Image as ROS_Image
from rospy.numpy_msg import numpy_msg
import time
from PIL import Image as PIL_Image
import numpy as np
import matplotlib.pyplot as plt

def vis_callback( data ):
    print(data.width)
    img = np.frombuffer(data.data, dtype=np.uint8).reshape(data.height, data.width, 4)


    print(img.shape)
    # print(img[:,:,0:2].shape)
    img = img[:,:,0:3]
    img = img[...,::-1]
    img = PIL_Image.fromarray(img, 'RGB')
    
    img.show()
    time.sleep(1)

    # time.sleep(1)
    # plt.close()




if __name__ == '__main__':
    rospy.init_node('image_reader', anonymous=True)
    image_sub = rospy.Subscriber("/zed_node/left/image_rect_color", numpy_msg(ROS_Image), vis_callback)
    rospy.spin()