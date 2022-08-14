import colorsys
from pathlib import Path

import numpy as np
import torch
import torch.nn as nn

from .nets.yolo import YoloBody
from .utils.utils import cvtColor, get_anchors, get_classes, preprocess_input, resize_image
from .utils.utils_bbox import DecodeBox


class YOLO(object):
    _defaults = {
        "model_path"        : "src/utils/yolo/model_data/yolo_weights.pth",        # 权值文件
        "classes_path"      : "src/utils/yolo/model_data/voc_classes.txt",         # 

        "anchors_path"      : 'src/utils/yolo/model_data/yolo_anchors.txt',        # 先验框对应的txt文件，一般不修改
        "anchors_mask"      : [[6, 7, 8], [3, 4, 5], [0, 1, 2]],    # 帮助代码找到对应的先验框，一般不修改

        "input_shape"       : [416, 416],   # 输入图片的大小，必须为32的倍数
        "confidence"        : 0.3,          # 只有得分大于置信度的预测框会被保留下来
        "nms_iou"           : 0.3,          # 非极大抑制所用到的nms_iou大小
        "letterbox_image"   : False,        # 控制是否使用letterbox_image对输入图像进行不失真的resize
        "cuda"              : True,        # 是否使用Cuda
    }

    @classmethod
    def get_defaults(cls, n):
        if n in cls._defaults:
            return cls._defaults[n]
        else:
            return "Unrecognized attribute name '" + n + "'"

    def __init__(self, root_dir: Path, cuda=True):
        self.__dict__.update(self._defaults)
        self.model_path = root_dir.joinpath(self.model_path)
        self.classes_path = root_dir.joinpath(self.classes_path)
        self.anchors_path = root_dir.joinpath(self.anchors_path)
        self.cuda = cuda
        
        # 获得种类和先验框的数量
        self.class_names, self.num_classes  = get_classes(self.classes_path)
        self.anchors, self.num_anchors      = get_anchors(self.anchors_path)
        self.bbox_util                      = DecodeBox(self.anchors, self.num_classes, (self.input_shape[0], self.input_shape[1]), self.anchors_mask)

        # 画框设置不同的颜色
        hsv_tuples = [(x / self.num_classes, 1., 1.) for x in range(self.num_classes)]
        self.colors = list(map(lambda x: colorsys.hsv_to_rgb(*x), hsv_tuples))
        self.colors = list(map(lambda x: (int(x[0] * 255), int(x[1] * 255), int(x[2] * 255)), self.colors))
        self.generate()

    def generate(self):
        # 建立yolov3模型，载入yolov3模型的权重
        self.net    = YoloBody(self.anchors_mask, self.num_classes)
        device      = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        self.net.load_state_dict(torch.load(self.model_path, map_location=device))
        self.net    = self.net.eval()
        print('{} model, anchors, and classes loaded.'.format(self.model_path))

        if self.cuda:
            self.net = nn.DataParallel(self.net)
            self.net = self.net.cuda()

    def detect_image(self, image, count = False):
        """
        The output is a 2-D numpy array. The numbers are integers.
        The structure of the output is [[left, top, right, bottom, score, type], [...], ...],
        where 0 <= score <= 100.
        """

        image_shape = np.array(np.shape(image)[0:2])
        image       = cvtColor(image)
        image_data  = resize_image(image, (self.input_shape[1], self.input_shape[0]), self.letterbox_image)
        image_data  = np.expand_dims(np.transpose(preprocess_input(np.array(image_data, dtype='float32')), (2, 0, 1)), 0)

        with torch.no_grad():
            images = torch.from_numpy(image_data)
            if self.cuda:
                images = images.cuda()

            # 将图像输入网络当中进行预测 (SLOW!!!)
            outputs = self.net(images)
            outputs = self.bbox_util.decode_box(outputs)

            # 将预测框进行堆叠，然后进行非极大抑制
            results = self.bbox_util.non_max_suppression(torch.cat(outputs, 1), self.num_classes, self.input_shape, 
                        image_shape, self.letterbox_image, conf_thres = self.confidence, nms_thres = self.nms_iou)
            
            # output
            if results[0] is None: 
                return np.empty(shape=(0, 6), dtype=int)
            else:
                # permutation
                p = np.array([  [0, 1, 0, 0, 0, 0, 0],
                                [1, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 1, 0, 0, 0],
                                [0, 0, 1, 0, 0, 0, 0],
                                [0, 0, 0, 0, 1000, 0, 0],
                                [0, 0, 0, 0, 0, 1000, 0],
                                [0, 0, 0, 0, 0, 0, 1]
                            ])
                r1 = np.matmul(results[0], p).astype(int)
                # calculate score
                return np.hstack((r1[:, :4], r1[:, 4:5] * r1[:, 5:6] // 10000, r1[:, 6:7]))
