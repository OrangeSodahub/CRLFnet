#!/usr/bin/env python3


from abc import ABC, abstractmethod
from typing import List
import numpy as np

from .transform import w2p, p2w
from .poi_and_roi import radar_poi, expand_poi, optimize_iou


class Sensor(ABC):

    @abstractmethod
    def __init__(self, name: str, R: np.ndarray) -> None:
        self.name = name
        self.zs = None
        self.R = R

    @abstractmethod
    def update(self, data: np.ndarray) -> None:
        pass

    @abstractmethod
    def obs_filter(self, useless_indices: np.ndarray) -> None:
        pass

    @abstractmethod
    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        pass

    @abstractmethod
    def obs2world(self, zs: np.ndarray = None) -> np.ndarray:
        pass

    @abstractmethod
    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        pass

    def __repr__(self) -> str:
        return self.name


class RadarSensor(Sensor):

    def __init__(self, name: str, R: np.ndarray, offset: np.ndarray) -> None:
        super().__init__(name, R)
        self.zs = np.empty((0, 2))
        self.boxes = np.empty((0, 3))
        self.offset = offset

    def update(self, data: np.ndarray) -> None:
        self.zs = data[:, 0:2]
        self.boxes = data[:, 0:3]

    def obs_filter(self, useless_indices: np.ndarray) -> None:
        idx = np.setdiff1d(np.arange(len(self.zs)), useless_indices)
        self.zs = self.zs[idx]
        self.boxes = self.boxes[idx]

    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        r = np.linalg.norm(pred_xpt[0:2] - self.offset[0:2])
        s = (pred_xpt[0] - self.offset[0]) / r
        c = (pred_xpt[1] - self.offset[1]) / r
        Hr = np.array([[-s, c], [-c / r, -s / r]])
        return Hr

    def obs2world(self, zs: np.ndarray = None) -> np.ndarray:
        if zs is None:
            zs = self.zs
        if len(zs) == 0:
            return np.empty((0, 2))
        else:
            x = self.offset[0] - zs[:, 0] * np.sin(zs[:, 1] * np.pi / 180)
            y = self.offset[1] + zs[:, 0] * np.cos(zs[:, 1] * np.pi / 180)
            return np.array([x, y]).T

    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        x, y = pos[0] - self.offset[0], pos[1] - self.offset[1]
        r = np.sqrt(np.square(x) + np.square(y))
        if x == 0:
            theta = 0
        elif y == 0:
            if x < 0:
                theta = 90
            else:
                theta = -90
        else:
            theta = -np.rad2deg(np.arctan(x / y))
            if y < 0:
                if x < 0:
                    theta = 180 - theta
                elif x > 0:
                    theta = -180 + theta
        z = np.array([r, theta])
        return z


class ImageSensor(Sensor):

    def __init__(self, name: str, R: np.ndarray, w2c: np.ndarray, c2p: np.ndarray, width: int, height: int, target_height: float) -> None:
        super().__init__(name, R)
        self.zs = np.empty((0, 2))
        self.boxes = np.empty((0, 6))
        self.size = np.array([width, height])
        self.w2c = w2c
        self.c2p = c2p
        self.target_height = target_height

    def update(self, data: np.ndarray) -> None:
        self.zs = np.concatenate([(data[:, 0:1] + data[:, 2:3]) // 2, (data[:, 1:2] + 3 * data[:, 3:4]) // 4], axis=1, dtype=int)
        self.boxes = data[0:6]
    
    def obs_filter(self, useless_indices: np.ndarray) -> None:
        idx = np.setdiff1d(np.arange(len(self.zs)), useless_indices)
        self.zs = self.zs[idx]
        self.boxes = self.boxes[idx]
    
    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        uv, zc = w2p(np.array([pred_xpt[0], pred_xpt[1], self.target_height, 1]), self.w2c, self.c2p)
        m0 = np.matmul(self.c2p, self.w2c)[0:2, 0:2]
        m1 = np.outer(uv[0:2], self.w2c[2, 0:2])
        Hi = (m0 - m1) / zc
        return Hi
    
    def obs2world(self, zs: np.ndarray = None) -> np.ndarray:
        if zs is None:
            zs = self.zs
        if len(zs) == 0:
            return np.empty((0, 2))
        else:
            return np.array([p2w(obs, self.target_height, self.w2c, self.c2p)[0][0:2] for obs in zs])
    
    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        return w2p(np.array([pos[0], pos[1], self.target_height, 1]), self.w2c, self.c2p)[0][0:2]


class FusedSensor(Sensor):
    '''Only support the fusion of a radar sensor and an image sensor currently.'''

    def __init__(self, R: np.ndarray, sensors: List[Sensor], weights: List[float]) -> None:
        name = "Fusion_of"
        for s in sensors:
            name += '_'
            name += s.name
        super().__init__(name, R)
        self.sensors = sensors
        self.weights = weights / np.sum(weights)
        self.zs = np.empty((0, 4))
    
    def update(self, data: np.ndarray) -> None:
        self.zs = data[:, 0:4]

    def obs_filter(self, useless_indices: np.ndarray) -> None:
        idx = np.setdiff1d(np.arange(len(self.zs)), useless_indices)
        self.zs = self.zs[idx]

    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        Hs = [s.H(pred_xpt) for s in self.sensors]
        return np.concatenate(Hs, axis=0)

    def obs2world(self, zs: np.ndarray = None) -> np.ndarray:
        if zs is None:
            zs = self.zs
        if len(zs) == 0:
            return np.empty((0, 2))
        else:
            w0 = self.sensors[0].obs2world(zs[:, 0:2])
            w1 = self.sensors[1].obs2world(zs[:, 2:4])
            w = self.weights[0] * w0 + self.weights[1] * w1
            return w

    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        zs = [s.world2obs(pos) for s in self.sensors]
        return np.concatenate(zs, axis=0)


class ObsBundle:

    def __init__(self, zs: List[np.ndarray], projs: np.ndarray, sensors: List[Sensor]) -> None:
        if len(zs) == len(projs) == len(sensors):
            self.zs = zs
            self.projections = projs
            self.sensors = sensors
            self.total_objs = len(self.zs)
        else:
            raise ValueError("zs: {}, ps: {}, ss: {}".format(len(zs), len(projs), len(sensors)))

    def __repr__(self) -> str:
        return "Observations ({}):\n{}\nProjections:\n{}\nFrom Sensors:\n{}"\
            .format(self.total_objs, self.zs, self.projections, self.sensors)

    def __add__(self, other):
        zs = self.zs + other.zs
        ps = np.concatenate([self.projections, other.projections], axis=0)
        ss = self.sensors + other.sensors
        return ObsBundle(zs, ps, ss)


class SensorClust:

    def __init__(self, sensors: List[Sensor]) -> None:
        self.sensors = sensors

    def update(self, data: List[np.ndarray]) -> None:
        for s, d in zip(self.sensors, data):
            s.update(d)

    def observe(self) -> ObsBundle:
        # TODO: improve code
        zs, ss = [], []
        ps = np.concatenate([s.obs2world() for s in self.sensors], axis=0)
        for s in self.sensors:
            for z in s.zs:
                zs.append(z)
                ss.append(s)
        return ObsBundle(zs, ps, ss)


class SensorPair:

    def __init__(self, R: np.ndarray, radar_sensor: RadarSensor, image_sensor: ImageSensor, iou_threshold: float) -> None:
        self.radar = radar_sensor
        self.image = image_sensor
        self.fused_sensor = FusedSensor(R, [radar_sensor, image_sensor], [1.0, 0.0])
        self.iou_threshold = iou_threshold

    def update(self, radar_data: np.ndarray, image_data: np.ndarray) -> None:
        self.radar.update(radar_data)
        self.image.update(image_data)

    def observe(self) -> ObsBundle:
        radar_pois = radar_poi(self.radar.obs2world(), self.image.w2c, self.image.c2p, self.image.target_height)
        image_rois = self.image.boxes[0:4]
        # IOU matching
        radar_expanded_rois = np.array(list(map(
            lambda p, d: expand_poi(p, d, self.image.size[0],self.image.size[1]),
            radar_pois, self.radar.zs[:, 0])),
            dtype=int)
        fused_rad_idx, fused_cam_idx = optimize_iou(radar_expanded_rois, image_rois, self.iou_threshold)
        # get observation bundle
        fused_zs = np.concatenate([self.radar.zs[fused_rad_idx, 0:3], self.image.zs[fused_cam_idx, 0:2]], axis=1)
        self.fused_sensor.update(fused_zs)
        self.radar.obs_filter(fused_rad_idx)
        self.image.obs_filter(fused_cam_idx)
        # TODO: improve code
        zs, ss = [], []
        ps = np.concatenate([self.fused_sensor.obs2world(), self.radar.obs2world(), self.image.obs2world()], axis=0)
        for s in [self.fused_sensor, self.radar, self.image]:
            for z in s.zs:
                zs.append(z)
                ss.append(s)
        return ObsBundle(zs, ps, ss)
