import torch
import numpy as np
# odometry type
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseWithCovariance
from geometry_msgs.msg import TwistWithCovariance
# from Quaternion to RPY
from tf.transformations import euler_from_quaternion
from .iou3d import iou3d_nms_cuda
from . import common_utils


def eval3d(odom: Odometry, pred_boxes3d: np.array, logger, counter: int, alpha_diff, pose_diff):
    pose = odom.pose # position
    twist = odom.twist  # velocity
    pose_ground_truth = np.array([pose.pose.position.x, pose.pose.position.y, 0.33/2])
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

    # iou3d and iou_bev
    boxes3d = np.concatenate((pose_ground_truth, np.array([0.33, 0.22, 0.21]), np.array([(y if y>=0 else (np.pi-y))])), axis=0)
    # load to gpu: double->float64 float->float32
    boxes3d_gpu = torch.tensor(np.array([boxes3d]), dtype=torch.float32).cuda() # for one car!!!
    pred_boxes3d_gpu = torch.tensor(pred_boxes3d, dtype=torch.float32).cuda() # GPU accelerate
    iou3d = boxes_iou3d_gpu(boxes_a=boxes3d_gpu, boxes_b=pred_boxes3d_gpu)
    iou_bev = boxes_iou_bev_gpu(boxes_a=boxes3d_gpu, boxes_b=pred_boxes3d_gpu)
    iou3d_cpu = iou3d.cpu().numpy() # convert tensor to numpy
    iou_bev_cpu = iou_bev.cpu().numpy()
    logger.log_value('iou3d', iou3d_cpu[0][0], counter) # here [0][0] is for one car!!!
    logger.log_value('iou_bev', iou_bev_cpu[0][0], counter)

    return alpha_diff, pose_diff


def boxes_iou_bev_cpu(boxes_a, boxes_b):
    """
    Args:
        boxes_a: (N, 7) [x, y, z, dx, dy, dz, heading]
        boxes_b: (M, 7) [x, y, z, dx, dy, dz, heading]

    Returns:
        ans_iou: (N, M)
    """
    boxes_a, is_numpy = common_utils.check_numpy_to_torch(boxes_a)
    boxes_b, is_numpy = common_utils.check_numpy_to_torch(boxes_b)
    assert not (boxes_a.is_cuda or boxes_b.is_cuda), 'Only support CPU tensors'
    assert boxes_a.shape[1] == 7 and boxes_b.shape[1] == 7
    ans_iou = boxes_a.new_zeros(torch.Size((boxes_a.shape[0], boxes_b.shape[0])))
    iou3d_nms_cuda.boxes_iou_bev_cpu(boxes_a.contiguous(), boxes_b.contiguous(), ans_iou)

    return ans_iou.numpy() if is_numpy else ans_iou


def boxes_iou_bev_gpu(boxes_a, boxes_b):
    """
    Args:
        boxes_a: (N, 7) [x, y, z, dx, dy, dz, heading]
        boxes_b: (M, 7) [x, y, z, dx, dy, dz, heading]

    Returns:
        ans_iou: (N, M)
    """
    assert boxes_a.shape[1] == boxes_b.shape[1] == 7
    ans_iou = torch.cuda.FloatTensor(torch.Size((boxes_a.shape[0], boxes_b.shape[0]))).zero_()

    iou3d_nms_cuda.boxes_iou_bev_gpu(boxes_a.contiguous(), boxes_b.contiguous(), ans_iou)

    return ans_iou


def boxes_iou3d_gpu(boxes_a, boxes_b):
    """
    Args:
        boxes_a: (N, 7) [x, y, z, dx, dy, dz, heading]
        boxes_b: (M, 7) [x, y, z, dx, dy, dz, heading]

    Returns:
        ans_iou: (N, M)
    """
    assert boxes_a.shape[1] == boxes_b.shape[1] == 7

    # height overlap
    boxes_a_height_max = (boxes_a[:, 2] + boxes_a[:, 5] / 2).view(-1, 1)
    boxes_a_height_min = (boxes_a[:, 2] - boxes_a[:, 5] / 2).view(-1, 1)
    boxes_b_height_max = (boxes_b[:, 2] + boxes_b[:, 5] / 2).view(1, -1)
    boxes_b_height_min = (boxes_b[:, 2] - boxes_b[:, 5] / 2).view(1, -1)

    # bev overlap
    overlaps_bev = torch.cuda.FloatTensor(torch.Size((boxes_a.shape[0], boxes_b.shape[0]))).zero_()  # (N, M)
    iou3d_nms_cuda.boxes_overlap_bev_gpu(boxes_a.contiguous(), boxes_b.contiguous(), overlaps_bev)

    max_of_min = torch.max(boxes_a_height_min, boxes_b_height_min)
    min_of_max = torch.min(boxes_a_height_max, boxes_b_height_max)
    overlaps_h = torch.clamp(min_of_max - max_of_min, min=0)

    # 3d iou
    overlaps_3d = overlaps_bev * overlaps_h

    vol_a = (boxes_a[:, 3] * boxes_a[:, 4] * boxes_a[:, 5]).view(-1, 1)
    vol_b = (boxes_b[:, 3] * boxes_b[:, 4] * boxes_b[:, 5]).view(1, -1)

    iou3d = overlaps_3d / torch.clamp(vol_a + vol_b - overlaps_3d, min=1e-6)

    return iou3d