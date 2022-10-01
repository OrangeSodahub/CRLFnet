import os
import torch
import numpy as np
from pathlib import Path
from tensorboardX import SummaryWriter
# odometry type
from .iou3d import iou3d_nms_cuda
from . import common_utils
from ..utils.visualization import Visualvehicle


class eval3d():

    def __init__(self, log_dir: str):
        self.log_dir = log_dir
        self.writter = SummaryWriter(log_dir=log_dir)
        self.heat_map_pose = np.zeros((32, 64))
        self.heat_map_alpha = np.zeros((32, 64))
        self.heat_map_alpha_similarity = np.zeros((32, 64))
        self.heat_map_iou = np.zeros((32, 64))
        self.heat_map_count = np.zeros((32, 64))

        self.counter = 0
        self.global_counter = 0

        N_SAMPLE_PTS = 41
        self.thresholds = np.linspace(0.0, 1.0, num=N_SAMPLE_PTS, endpoint=True)
        self.tp_fp_fn = np.array([np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS)])

    def eval(self, odom, preboxes3d: np.array, postboxes3d: np.array, scores3d: np.array):
        print("{} done.".format(self.global_counter), end='\r')
        self.global_counter += 1
        if len(preboxes3d) != 0 and len(postboxes3d) != 0:
            print("{}, global: {} have obects.".format(self.counter, self.global_counter))
            self.counter += 1
            for prebox3d, postbox3d in zip(preboxes3d, postboxes3d):
                prebox3d[6] = (prebox3d[6] - np.pi) if prebox3d[6] >= 0 else (np.pi + prebox3d[6])
                postbox3d[6] = (postbox3d[6] - np.pi) if postbox3d[6] >= 0 else (np.pi + postbox3d[6])
            gt_boxes3d = common_utils.get_gt_boxes3d(odom)

            # rotation
            alpha_precision_pre, alpha_similarity_pre = self.eval_rotation(gt_boxes3d, preboxes3d)
            self.writter.add_scalars('alpha_precision', {'pre': alpha_precision_pre}, self.counter)
            alpha_precision_post, alpha_similarity_post = self.eval_rotation(gt_boxes3d, postboxes3d)
            self.writter.add_scalars('alpha_precision', {'post': alpha_precision_post}, self.counter)

            # pose
            pose_diff = self.eval_pose(gt_boxes3d, preboxes3d)
            self.writter.add_scalars('pose_diff', {'pre': pose_diff}, self.counter)
            pose_diff = self.eval_pose(gt_boxes3d, postboxes3d)
            self.writter.add_scalars('pose_diff', {'post': pose_diff}, self.counter)

            # iou and tp
            iou_bev_pre = self.eval_iou(gt_boxes3d, preboxes3d)
            self.writter.add_scalars('iou_bev', {'pre': iou_bev_pre}, self.counter)
            iou_bev_post = self.eval_iou(gt_boxes3d, postboxes3d)
            self.writter.add_scalars('iou_bev', {'post': iou_bev_post}, self.counter)

            # score
            self.writter.add_scalars('alpha_precision', {'score': scores3d[0]}, self.counter)
            self.writter.add_scalars('pose_diff', {'score': 1 - scores3d[0]}, self.counter)
            self.writter.add_scalars('iou_bev', {'score': scores3d[0]}, self.counter)

            # heat map
            if isinstance(odom, np.ndarray):
                i = int((odom[0] + 2) // 0.125)
                j = int((odom[1] + 5) // 0.125)
                if i >= 0 and i < 32 and j >= 0 and j < 64:
                    self.heat_map_pose[i][j] += pose_diff
                    self.heat_map_alpha[i][j] += alpha_precision_pre
                    self.heat_map_alpha_similarity[i][j] += alpha_similarity_pre
                    self.heat_map_iou[i][j] += iou_bev_pre
                    self.heat_map_count[i][j] += 1
        else:
            self.tp_fp_fn[2] += 1

        if self.global_counter % 29900 == 0:
            np.savetxt(os.path.join(self.log_dir, 'tp_fp_fn.txt'), self.tp_fp_fn)
            for i in range(len(self.heat_map_count)):
                for j in range(len(self.heat_map_count[i])):
                    if self.heat_map_count[i][j] != 0:
                        self.heat_map_pose[i][j] /= self.heat_map_count[i][j]
                        self.heat_map_alpha[i][j] /= self.heat_map_count[i][j]
                        self.heat_map_alpha_similarity[i][j] /= self.heat_map_count[i][j]
                        self.heat_map_iou[i][j] /= self.heat_map_count[i][j]
            np.savetxt(os.path.join(self.log_dir, 'heat_map_pose.txt'), self.heat_map_pose)
            np.savetxt(os.path.join(self.log_dir, 'heat_map_alpha.txt'), self.heat_map_alpha)
            np.savetxt(os.path.join(self.log_dir, 'heat_map_alpha_similarity.txt'), self.heat_map_alpha_similarity)
            np.savetxt(os.path.join(self.log_dir, 'heat_map_iou_bev.txt'), self.heat_map_iou)
            np.savetxt(os.path.join(self.log_dir, 'heat_map_iou_count.txt'), self.heat_map_count)

    def eval_rotation(self, gt_boxes3d, boxes3d):
        # ((boxes3d[0][6] - np.pi) if boxes3d[0][6] >= 0 else (np.pi + boxes3d[0][6]))
        alpha_diff = np.abs(boxes3d[0][6] - gt_boxes3d[0][6])  # pred_boxes3d[0] -> for one car
        alpha_precision = 1 - (alpha_diff) / (2 * np.pi)
        alpha_similarity = (1 + np.cos(2 * alpha_diff)) / 2
        return alpha_precision, alpha_similarity

    def eval_pose(self, gt_boxes3d, boxes3d):
        # pose_x_y
        x_diff = np.abs(gt_boxes3d[0][0] - boxes3d[0][0])
        y_diff = np.abs(gt_boxes3d[0][1] - boxes3d[0][1])
        pose_diff = np.sqrt(np.square(x_diff) + np.square(y_diff))
        return pose_diff

    def eval_iou(self, gt_boxes3d, boxes3d):
        # iou3d and iou_bev
        gt_boxes3d_gpu = torch.tensor(gt_boxes3d, dtype=torch.float32).cuda()  # load to gpu: double->float64 float->float32
        boxes3d_gpu = torch.tensor(boxes3d, dtype=torch.float32).cuda()  # load to gpu

        iou3d = boxes_iou3d_gpu(boxes_a=gt_boxes3d_gpu, boxes_b=boxes3d_gpu)
        iou_bev = boxes_iou_bev_gpu(boxes_a=gt_boxes3d_gpu, boxes_b=boxes3d_gpu)
        iou3d_cpu = iou3d.cpu().numpy()  # iou3d_cpu[0][0]
        iou_bev_cpu = iou_bev.cpu().numpy()  # iou_bev_cpu[0][0]

        # caculate tp_fp_fn
        true_or_false = iou_bev_cpu[0][0] > self.thresholds
        self.tp_fp_fn[0] += true_or_false  # tp
        self.tp_fp_fn[2] += np.logical_not(true_or_false)  # fn

        return iou_bev_cpu[0][0]


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
    pass


class Evalagent():

    def __init__(self, num: int = None, save_dir: Path = None, vis: Visualvehicle=None):
        self.num = num
        self.dir = str(save_dir)
        self.frame = 0
        self.pose = []
        self.velocity = []
        self.density = []
        self.flow = []
        self.counter = 0
        self.vis = vis

    def write(self, poses: np.array, throttles: np.ndarray, density: np.ndarray, flow: np.ndarray):
        """
        update records
        """
        if self.counter == 10000:
            self.save()
        frame_pose = np.array([[pose[0][0], pose[0][1]] for pose in poses]).reshape(1, -1)[0]
        self.pose.append(frame_pose)
        self.velocity.append(np.array(throttles))
        self.density.append(np.array(density))
        self.flow = flow
        self.counter += 1

    def save(self):
        """
        save results to files
        """
        np.savetxt(os.path.join(self.dir, 'pose.txt'), self.pose)
        np.savetxt(os.path.join(self.dir, 'velocity.txt'), self.velocity)
        np.savetxt(os.path.join(self.dir, 'density.txt'), self.density)
        for i, n in enumerate(self.flow):
            np.savetxt(os.path.join(self.dir, 'flow_{}.txt'.format(i)), n)
        self.pose.clear()
        self.velocity.clear()
        self.density.clear()
        self.flow.clear()
        print("\033[0;32msaved.\033[0m")

    def eval(self, frame: int):
        # visualization
        v = np.loadtxt(os.path.join(self.dir, 'velocity.txt'))
        d = np.loadtxt(os.path.join(self.dir, 'density.txt'))
        f = [np.loadtxt(os.path.join(self.dir, 'flow_{}.txt'.format(i))) for i in range(7)]

        # preprocess
        # mask = np.random.randint(low=0, high=len(f[1]), size=20)
        # f[1] = np.delete(f[1], mask, axis=0)

        # calc overall flow
        # sum_flow = np.array([len(f_) for f_ in f]).sum()
        # print(sum_flow)
        
        self.vis('d', d, self.num, frame)
