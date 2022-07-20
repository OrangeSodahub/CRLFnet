import numpy as np
import torch
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from .transform import world2pixel


label2camera = {
    1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
    5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
}


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


def get_dpm(calib: np.array, camera_num: int, ground_pose: np.array, type: int):
    """
        Dots per m
    """
    # label2camera
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }

    camera_name = label2camera[camera_num]
    if not type:
        world_pose_1, world_pose_2 = np.array([ground_pose[0], ground_pose[1]-0.2, 0.2, 1]), np.array([ground_pose[0], ground_pose[1]+0.2, 0.2, 1])
    elif type:
        world_pose_1, world_pose_2 = np.array([ground_pose[0]-0.2, ground_pose[1], 0.2, 1]), np.array([ground_pose[0]+0.2, ground_pose[1], 0.2, 1])

    pixel_pose_1, pixel_pose_2 = world2pixel(calib, camera_name, world_pose_1), world2pixel(calib, camera_name, world_pose_2)
    dpm = 0.4 / abs(pixel_pose_2[0]-pixel_pose_1[0])

    return dpm