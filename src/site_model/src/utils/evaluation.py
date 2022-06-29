import numpy as np
# odometry type
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseWithCovariance
from geometry_msgs.msg import TwistWithCovariance
# from Quaternion to RPY
from tf.transformations import euler_from_quaternion

def eval3d(odom: Odometry, pred_boxes3d: np.array, logger, counter: int, alpha_diff, pose_diff):
    pose = odom.pose # position
    twist = odom.twist  # velocity
    pose_ground_truth = [pose.pose.position.x, pose.pose.position.y]
    r, p, y = euler_from_quaternion([pose.pose.orientation.x, pose.pose.orientation.y,
                                                pose.pose.orientation.z, pose.pose.orientation.w])
    # rotation
    alpha_cur_diff = np.abs(pred_boxes3d[0][6]-(y if y>=0 else (np.pi-y))) # pred_boxes3d[0] -> for one car
    alpha_diff += alpha_cur_diff
    alpha_cur_precision = 1 - (alpha_cur_diff / counter) / (2*np.pi)
    alpha_precision = 1 - (alpha_diff / counter) / (2*np.pi)
    logger.log_value('alpha_precision', alpha_precision, counter)
    logger.log_value('alpha_cur_precision', alpha_cur_precision, counter)
    # pose_x_y
    x_cur_diff = np.abs(pose_ground_truth[0]-pred_boxes3d[0][0])
    y_cur_diff = np.abs(pose_ground_truth[1]-pred_boxes3d[0][1])
    pose_cur_diff = np.sqrt(np.square(x_cur_diff)+np.square(y_cur_diff))
    pose_diff += pose_cur_diff
    pose_mean_diff = pose_diff / counter
    logger.log_value('pose_diff', pose_mean_diff, counter)
    logger.log_value('pose_cur_diff', pose_cur_diff, counter)

    return alpha_diff, pose_diff