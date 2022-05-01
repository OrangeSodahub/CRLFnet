import copy
import pickle
import os

import numpy as np
from skimage import io

from . import custom_utils
from ...ops.roiaware_pool3d import roiaware_pool3d_utils
from ...utils import box_utils, calibration_kitti, common_utils, object3d_kitti
from ..dataset import DatasetTemplate

class CustomDataset(DatasetTemplate):
    def __init__(self, dataset_cfg, class_names, training=True, root_path=None, logger=None, ext='.bin'):
        """
        Args:
            root_path:
            dataset_cfg:
            class_names:
            training:
            logger:
        """
        super().__init__(
            dataset_cfg=dataset_cfg, class_names=class_names, training=training, root_path=root_path, logger=logger
        )
        self.split = self.dataset_cfg.DATA_SPLIT[self.mode]
        self.root_split_path = os.path.join(
            self.root_path, ('training' if self.split != 'test' else 'testing'))

        split_dir = os.path.join(self.root_path, 'ImageSets',(self.split + '.txt'))
        print("split_dir:",split_dir)
        self.sample_id_list = [x.strip() for x in open(split_dir).readlines()] if os.path.exists(split_dir) else None

        self.ext = ext

                
    def __len__(self):
        return len(self.sample_id_list)

    def __getitem__(self, index):
        """
        Function:
            Read 'velodyne' folder as pointclouds
            Read 'label_2' folder as labels
            Return type 'dict'
        """
        lidar_file = os.path.join(self.root_split_path,
                               'velodyne', (self.sample_id_list[index]+self.ext))
        if self.ext == '.bin':
            points = np.fromfile(lidar_file, dtype=np.float32).reshape(-1, 4)
        elif self.ext == '.npy':
            points = np.load(lidar_file)
        else:
            raise NotImplementedError

        input_dict = {
            'points': points,
            'frame_id': self.sample_id_list[index],
        }
        # gt_boxes
        gt = self.create_groundtruth_database(self.sample_id_list[index])
        if 'annos' in gt:
            annos = gt['annos']
            annos = common_utils.drop_info_with_name(annos, name='DontCare')
            loc, dims, rots = annos['location'], annos['dimensions'], annos['rotation_y']
            gt_names = annos['name']
            gt_boxes_lidar = annos['gt_boxes_lidar']

            input_dict.update({
                'gt_names': gt_names,
                'gt_boxes': gt_boxes_lidar
            })

        data_dict = self.prepare_data(data_dict=input_dict)
        return data_dict

    def create_groundtruth_database(self, info_path=None, used_classes=None, split='train'):
            import torch

            database_save_path = Path(self.root_path) / ('gt_database' if split == 'train' else ('gt_database_%s' % split))
            db_info_save_path = Path(self.root_path) / ('kitti_dbinfos_%s.pkl' % split)

            database_save_path.mkdir(parents=True, exist_ok=True)
            all_db_infos = {}

            with open(info_path, 'rb') as f:
                infos = pickle.load(f)

            for k in range(len(infos)):
                print('gt_database sample: %d/%d' % (k + 1, len(infos)))
                info = infos[k]
                sample_idx = info['point_cloud']['lidar_idx']
                points = self.get_lidar(sample_idx)
                annos = info['annos']
                names = annos['name']
                difficulty = annos['difficulty']
                bbox = annos['bbox']
                gt_boxes = annos['gt_boxes_lidar']

                num_obj = gt_boxes.shape[0]
                point_indices = roiaware_pool3d_utils.points_in_boxes_cpu(
                    torch.from_numpy(points[:, 0:3]), torch.from_numpy(gt_boxes)
                ).numpy()  # (nboxes, npoints)

                for i in range(num_obj):
                    filename = '%s_%s_%d.bin' % (sample_idx, names[i], i)
                    filepath = database_save_path / filename
                    gt_points = points[point_indices[i] > 0]

                    gt_points[:, :3] -= gt_boxes[i, :3]
                    with open(filepath, 'w') as f:
                        gt_points.tofile(f)

                    if (used_classes is None) or names[i] in used_classes:
                        db_path = str(filepath.relative_to(self.root_path))  # gt_database/xxxxx.bin
                        db_info = {'name': names[i], 'path': db_path, 'image_idx': sample_idx, 'gt_idx': i,
                                'box3d_lidar': gt_boxes[i], 'num_points_in_gt': gt_points.shape[0],
                                'difficulty': difficulty[i], 'bbox': bbox[i], 'score': annos['score'][i]}
                        if names[i] in all_db_infos:
                            all_db_infos[names[i]].append(db_info)
                        else:
                            all_db_infos[names[i]] = [db_info]
            for k, v in all_db_infos.items():
                print('Database %s: %d' % (k, len(v)))

            with open(db_info_save_path, 'wb') as f:
                pickle.dump(all_db_infos, f)