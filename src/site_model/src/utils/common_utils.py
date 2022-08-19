import numpy as np
import torch
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion


label2camera = {
    1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
    5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
}
label2camera_ = {
    1: 'camera_11', 2: 'camera_12', 3: 'camera_13', 4: 'camera_14',
    5: 'camera_41', 6: 'camera_42', 7: 'camera_43', 8: 'camera_44'
}

transform = {'camera11': 0, 'camera12': 1, 'camera13': 2, 'camera14': 3,
            'camera2': 4, 'camera3': 5,
            'camera41': 6, 'camera42': 7, 'camera43': 8, 'camera44': 9}

def check_numpy_to_torch(x):
    if isinstance(x, np.ndarray):
        return torch.from_numpy(x).float(), True
    return x, False


def get_gt_boxes3d(odom):
    """
        output boxes3d according to odom meessage (just for one car temporarily)
    """
    if isinstance(odom, Odometry):
        r, p, y = euler_from_quaternion([odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                                        odom.pose.pose.orientation.z, odom.pose.pose.orientation.w])
        gt_boxes3d = [np.array([odom.pose.pose.position.x, odom.pose.pose.position.y, 0.1120, 0.33, 0.22, 0.21, y])]
    elif isinstance(odom, np.ndarray):
        r, p, y = euler_from_quaternion([odom[3], odom[4], odom[5], odom[2]])
        gt_boxes3d = [np.array([odom[0], odom[1], 0.1120, 0.33, 0.22, 0.21, y])]
    return np.array(gt_boxes3d)
