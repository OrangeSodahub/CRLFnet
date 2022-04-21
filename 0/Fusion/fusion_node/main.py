import numpy as np
import jsonpickle
import rospy
import time
from matcher import match
from std_msgs.msg import String



def callback_clusters(message):
    d = jsonpickle.decode(message.data)
    clusters = d
    print("@", time.time(), "\n", np.array(d['centroids']))

def callback_boxes(message):
    d = jsonpickle.decode(message.data)
    print("@", time.time(), "\n", d)
    
    matched = match(d, clusters)

    fus_pub.publish(jsonpickle.encode(matched))

if __name__ == '__main__':
    clusters = None

    rospy.init_node('radar_camera_fusion', anonymous=True)

    rospy.Subscriber("/radar_pipeline/clusters", String, callback_clusters)
    rospy.Subscriber("/2d_node/results", String, callback_boxes)
    
    fus_pub = rospy.Publisher("/fusion/results", String, queue_size=10)
    
    rospy.spin()