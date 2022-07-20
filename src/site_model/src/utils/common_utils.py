import numpy as np
import torch
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion


def check_numpy_to_torch(x):
    if isinstance(x, np.ndarray):
        return torch.from_numpy(x).float(), True
    return x, False


def get_gt_boxes3d(odom: Odometry):
    """
        output boxes3d according to odom meessage (just for one car temporarily)
    """
    r, p, y = euler_from_quaternion([odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                                    odom.pose.pose.orientation.z, odom.pose.pose.orientation.w])
    
    gt_boxes3d = []
    gt_box3d = np.array([odom.pose.pose.position.x, odom.pose.pose.position.y, 0.1120, 0.33, 0.22, 0.21, y])
    gt_boxes3d.append(gt_box3d)
    return np.array(gt_boxes3d)


def get_dpm(corner3d):
    """
        Dots per m
    """
    # vertical
    
    # horizontal