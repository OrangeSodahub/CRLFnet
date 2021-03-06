import torch
import numpy as np
from tensorboard_logger import Logger
# odometry type
from nav_msgs.msg import Odometry
from .iou3d import iou3d_nms_cuda
from . import common_utils


class eval3d():
    def __init__(self, log_dir: str):
        self.log_dir = log_dir
        self.logger = Logger(logdir=log_dir, flush_secs=10)

        self.counter = 1
        self.alpha_diff = 0
        self.pose_diff = 0
        self.iou3d = 0
        self.iou_bev = 0

        N_SAMPLE_PTS = 41
        self.thresholds = np.linspace(0.0, 1.0, num=N_SAMPLE_PTS, endpoint=True)
        self.tp_fp_fn = np.array([np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS)])
    

    def eval(self, odom: Odometry, boxes3d: np.array):
        if len(boxes3d) != 0:
            self.counter += 1
            print(self.counter)
            for box3d in boxes3d:                                                       # boxes3d
                box3d[6] = (box3d[6] - np.pi) if box3d[6] >=0 else (np.pi + box3d[6])
            gt_boxes3d = common_utils.get_gt_boxes3d(odom)                              # gt_boxes3d
            
            self.eval_rotation(gt_boxes3d, boxes3d)                                     # rotation
            self.eval_pose(gt_boxes3d, boxes3d)                                         # pose
            self.eval_iou(gt_boxes3d, boxes3d)                                          # iou and tp
        else:
            self.tp_fp_fn[2] += 1

        if self.counter % 1000 == 0:
            np.savetxt(self.log_dir + 'tp_fp_fn.txt', self.tp_fp_fn)
            

    def eval_rotation(self, gt_boxes3d, boxes3d):
        alpha_cur_diff = np.abs(((boxes3d[0][6] - np.pi) if boxes3d[0][6] >= 0 else (np.pi + boxes3d[0][6])) - gt_boxes3d[0][6]) # pred_boxes3d[0] -> for one car
        self.alpha_diff += alpha_cur_diff
        alpha_cur_precision = 1 - (alpha_cur_diff / self.counter) / (2*np.pi)
        alpha_precision = 1 - (self.alpha_diff / self.counter) / (2*np.pi)
        self.logger.log_value('alpha_precision', alpha_precision, self.counter)
        self.logger.log_value('alpha_cur_precision', alpha_cur_precision, self.counter)


    def eval_pose(self, gt_boxes3d, boxes3d):
        # pose_x_y
        x_cur_diff = np.abs(gt_boxes3d[0][0]-boxes3d[0][0])
        y_cur_diff = np.abs(gt_boxes3d[0][1]-boxes3d[0][1])
        pose_cur_diff = np.sqrt(np.square(x_cur_diff)+np.square(y_cur_diff))
        self.pose_diff += pose_cur_diff
        pose_mean_diff = self.pose_diff / self.counter
        self.logger.log_value('pose_diff', pose_mean_diff, self.counter)
        self.logger.log_value('pose_cur_diff', pose_cur_diff, self.counter)


    def eval_iou(self, gt_boxes3d, boxes3d):
        # iou3d and iou_bev
        gt_boxes3d_gpu = torch.tensor(gt_boxes3d, dtype=torch.float32).cuda()                           # load to gpu: double->float64 float->float32
        boxes3d_gpu = torch.tensor(boxes3d, dtype=torch.float32).cuda()                                 # load to gpu

        iou3d_cur = boxes_iou3d_gpu(boxes_a=gt_boxes3d_gpu, boxes_b=boxes3d_gpu)
        iou_bev_cur = boxes_iou_bev_gpu(boxes_a=gt_boxes3d_gpu, boxes_b=boxes3d_gpu)
        iou3d_cur_cpu = iou3d_cur.cpu().numpy()                                                         # convert tensor to numpy
        iou_bev_cur_cpu = iou_bev_cur.cpu().numpy()
        self.logger.log_value('iou3d_cur', iou3d_cur_cpu[0][0], self.counter)                           # here [0][0] is for one car!!!
        self.logger.log_value('iou_bev_cur', iou_bev_cur_cpu[0][0], self.counter)

        self.iou3d += iou3d_cur_cpu[0][0]
        self.iou_bev += iou_bev_cur_cpu[0][0]
        iou3d_mean = self.iou3d / self.counter
        iou_bev_mean = self.iou_bev / self.counter
        self.logger.log_value('iou3d_mean', iou3d_mean, self.counter)
        self.logger.log_value('iou_bev_mean', iou_bev_mean, self.counter)

        # caculate tp_fp_fn
        true_or_false = iou_bev_cur_cpu[0][0] > self.thresholds
        self.tp_fp_fn[0] += true_or_false                                                               # tp
        self.tp_fp_fn[2] += np.logical_not(true_or_false)                                               # fn


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


def bbox_iou(boxes3d: np.array, boxes2d: np.array, critierion=-1):
    # N = boxes.shape[0]
    # K = query_boxes.shape[0]
    # overlaps = np.zeros((N, K), dtype=boxes.dtype)
    # for k in range(K):
    #     qbox_area = ((query_boxes[k, 2] - query_boxes[k, 0]) *
    #                  (query_boxes[k, 3] - query_boxes[k, 1]))
    #     for n in range(N):
    #         iw = (min(boxes[n, 2], query_boxes[k, 2]) -
    #               max(boxes[n, 0], query_boxes[k, 0]))
    #         if iw > 0:
    #             ih = (min(boxes[n, 3], query_boxes[k, 3]) -
    #                   max(boxes[n, 1], query_boxes[k, 1]))
    #             if ih > 0:
    #                 if criterion == -1:
    #                     ua = (
    #                         (boxes[n, 2] - boxes[n, 0]) *
    #                         (boxes[n, 3] - boxes[n, 1]) + qbox_area - iw * ih)
    #                 elif criterion == 0:
    #                     ua = ((boxes[n, 2] - boxes[n, 0]) *
    #                           (boxes[n, 3] - boxes[n, 1]))
    #                 elif criterion == 1:
    #                     ua = qbox_area
    #                 else:
    #                     ua = 1.0
    #                 overlaps[n, k] = iw * ih / ua
    # return overlaps
    pass

def draw_pr_line():
    import matplotlib.pyplot as plt
    txt_dir = '/home/zonlin/CRLFnet/src/site_model/src/LidCamFusion/eval/3d_detection_only_1000.txt'
    tp_fp_fn = np.loadtxt(txt_dir)
    precision = tp_fp_fn[0] / (tp_fp_fn[0] + tp_fp_fn[1])
    recall = tp_fp_fn[0] / (tp_fp_fn[0] + tp_fp_fn[2])

    thresholds = np.linspace(0.0, 1.0, num=41, endpoint=True)

    plt.plot(thresholds, recall)
    plt.show()