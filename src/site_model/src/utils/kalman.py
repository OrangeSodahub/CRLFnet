#!/usr/bin/env python3

"""
Kalman Filter

Some Abbr.:
pred    ->  predicted
obs     ->  observation
zs      ->  observations
xpt(s)  ->  expectation / mean vector(s)
cov(s)  ->  covarience matirx (matrices)
idx     ->  index / indices
rmv     ->  remove
"""


from abc import ABC, abstractmethod
import numpy as np
from scipy.optimize import linear_sum_assignment

from .transform import w2p, p2w


class Sensor(ABC):

    @abstractmethod
    def __init__(self, name: str, R: np.ndarray) -> None:
        self.name = name
        self.obs = None
        self.R = R

    @abstractmethod
    def update(self, data: np.ndarray) -> None:
        pass

    @abstractmethod
    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        pass

    @abstractmethod
    def obs2world(self) -> np.ndarray:
        pass

    @abstractmethod
    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        pass


class RadarSensor(Sensor):

    def __init__(self, name: str, R: np.ndarray, offset: np.ndarray) -> None:
        super().__init__(name, R)
        self.obs = np.empty(3)
        self.offset = offset

    def update(self, data: np.ndarray) -> None:
        self.obs[0:3] = data[0:3]

    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        r = np.linalg.norm(pred_xpt[0:2] - self.offset[0:2])
        s = (pred_xpt[0] - self.offset[0]) / r
        c = (pred_xpt[1] - self.offset[1]) / r
        Hr = np.array([[-s, c], [-c / r, -s / r]])
        return Hr

    def obs2world(self) -> np.ndarray:
        x = self.offset[0] - self.obs[0] * np.sin(self.obs[1] * np.pi / 180)
        y = self.offset[1] + self.obs[0] * np.cos(self.obs[1] * np.pi / 180)
        return np.array([x, y])

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

    def __init__(self, name: str, R: np.ndarray, w2c: np.ndarray, c2p: np.ndarray, target_height: float) -> None:
        super().__init__(name, R)
        self.obs = np.empty(2)
        self.w2c = w2c
        self.c2p = c2p
        self.height = target_height

    def update(self, data: np.ndarray) -> None:
        self.obs[0] = np.mean(data[0:4:2])
        self.obs[1] = np.mean(data[1:4:2])
    
    def H(self, pred_xpt: np.ndarray) -> np.ndarray:
        uv, zc = w2p(np.array([pred_xpt[0], pred_xpt[1], self.height, 1]), self.w2c, self.c2p)
        m0 = np.matmul(self.c2p, self.w2c)[0:2, 0:2]
        m1 = np.outer(uv[0:2], self.w2c[2, 0:2])
        Hi = (m0 - m1) / zc
        return Hi
    
    def obs2world(self) -> np.ndarray:
        return p2w(self.obs, self.height, self.w2c, self.c2p)[0][0:2]
    
    def world2obs(self, pos: np.ndarray) -> np.ndarray:
        return w2p(np.array([pos[0], pos[1], self.height, 1]), self.w2c, self.c2p)[0][0:2]


class SensorBundle:

    def __init__(self) -> None:
        self.sensors = []
        self.total_zs = 0

    @property
    def projections(self) -> np.ndarray:
        pass

    def update(self) -> None:
        for s in self.sensors:
            s.update()


class Kalman:

    def __init__(self, size: int, Q: np.ndarray, threshold: float) -> None:
        self.xpts = np.empty((0, size))
        self.covs = np.empty((0, size, size))
        self.total_objs = 0
        
        self.Q = Q
        self.THRESHOLD = threshold

    def predict(self, A: np.ndarray) -> tuple:
        pred_xpts = np.matmul(self.xpts, A.T)
        pred_covs = np.matmul(A, np.matmul(self.covs, A.T)) + np.tile(self.Q, (self.total_objs, 1, 1))
        return pred_xpts, pred_covs

    def compare(self, pred_xpts: np.ndarray, zs: SensorBundle) -> tuple:
        # generate comparison matrix
        cmp = [np.linalg.norm(x - z) for x in pred_xpts for z in zs.projections]
        cmp = np.array(cmp).reshape(self.total_objs, zs.total_zs)
        # GNN
        xpt_idx, obs_idx = linear_sum_assignment(cmp)
        thres_filter = cmp[xpt_idx, obs_idx] < self.THRESHOLD
        # get index(indices) of objects form different sources
        xpt_idx = np.extract(thres_filter, xpt_idx)                     # pred_xpts
        rmv_idx = np.setdiff1d(np.arange(self.total_objs), xpt_idx)     # pred_xpts
        obs_idx = np.extract(thres_filter, obs_idx)                     # zs.projections
        new_idx = np.setdiff1d(np.arange(zs.total_zs), obs_idx)         # zs.projections
        return xpt_idx, obs_idx, rmv_idx, new_idx

    def __single_update(self, pred_xpt: np.ndarray, pred_cov: np.ndarray, pred_z: np.ndarray,
                        z: np.ndarray, H: np.ndarray, R: np.ndarray) -> tuple:
        S = np.matmul(H, np.matmul(pred_cov, H.T)) + R
        K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(S)))
        xpt = pred_xpt + np.matmul(K, (z - pred_z))
        cov = pred_cov - np.matmul(np.matmul(K, H), pred_cov)
        return xpt, cov

    def update(self, pred_xpts: np.ndarray, pred_covs: np.ndarray, zs: SensorBundle,
               xpt_idx: np.ndarray, obs_idx: np.ndarray) -> None:
        pass

    def remove(self, rmv_idx: np.ndarray) -> None:
        pass

    def create(self, zs: SensorBundle, new_idx: np.ndarray) -> None:
        pass

    def output(self) -> None:
        pass

    def flush(self, A: np.ndarray, zs: SensorBundle) -> None:
        pred_xpts, pred_covs = self.predict(A)
        xpt_idx, obs_idx, rmv_idx, new_idx = self.compare(pred_xpts, zs)
        self.update(pred_xpts, pred_covs, zs, xpt_idx, obs_idx)
        self.remove(rmv_idx)
        self.create(zs, new_idx)


class OldKalmanFilter:
    '''
    Semi-nonlinear Filter
    '''

    def __init__(self, w2c, c2p, radar_pos=np.array([-1.374, -1.176, 0.461])):
        # xpt = (Xw, Yw, Vx, Vy, age, id)
        self.xpt_pile = []
        self.cov_pile = []
        self.pred_xpt_pile = []
        self.pred_cov_pile = []
        self.total_objects = 0
        self.max_id = 0

        self.radar_pos = radar_pos
        self.w2c = w2c
        self.c2p = c2p

        self.MAX_AGE = 2
        self.THRESHOLD = 1e4
        self.WEIGHT_RADAR = 0.8
        self.WEIGHT_IMAGE = 0.2

    def __H_radar(self, pred_xpt: np.ndarray):
        r = np.linalg.norm(pred_xpt[0:2] - self.radar_pos[0:2])
        c = (pred_xpt[1] - self.radar_pos[1]) / r
        s = (pred_xpt[0] - self.radar_pos[0]) / r
        vn = pred_xpt[2] * c - pred_xpt[3] * s
        Hr = np.array( [[-s, c, 0, 0],
                        [-c / r, -s / r, 0, 0],
                        [(pred_xpt[2] - vn * s) / r, (pred_xpt[3] - vn * c) / r, -s, c]])
        return Hr

    def __H_image(self, pred_xpt: np.ndarray):
        uv, zc = w2p(np.array([pred_xpt[0], pred_xpt[1], self.radar_pos[2], 1]), self.w2c, self.c2p)
        m0 = np.concatenate((np.matmul(self.c2p, self.w2c)[0:2, 0:2], np.zeros(shape=(2, 2))), axis=1)
        m1 = np.outer(uv[0:2], [self.w2c[2, 0], self.w2c[2, 1], 0, 0])
        Hi = (m0 - m1) / zc
        return Hi

    def __H_match(self, pred_xpt: np.ndarray):
        Hr = self.__H_radar(pred_xpt)
        Hi = self.__H_image(pred_xpt)
        Hm = np.concatenate((Hr, Hi))
        return Hm

    def __h_radar(self, xpt: np.ndarray):
        x, y, vx, vy = xpt[0] - self.radar_pos[0], xpt[1] - self.radar_pos[1], xpt[2], xpt[3]
        r = np.sqrt(np.square(x) + np.square(y))
        if x == 0:
            theta = 0
        elif y == 0 and x < 0:
            theta = 90
        elif y == 0 and x > 0:
            theta = -90
        else:
            theta = -np.arctan(x / y)
            if x < 0 and y < 0:
                theta = 180 - theta
            elif x > 0 and y < 0:
                theta = -180 + theta
        vn = (vy * y + vx * x) / r
        zp = np.array([r, theta, vn])
        return zp

    def __h_image(self, xpt: np.ndarray):
        pos = np.array([xpt[0], xpt[1], self.radar_pos[2], 1])
        zp, _ = w2p(pos, self.w2c, self.c2p)
        return zp[0:2]

    def __h_match(self, xpt: np.ndarray):
        zpr = self.__h_radar(xpt)
        zpi = self.__h_image(xpt)
        zp = np.concatenate((zpr, zpi))
        return zp

    def __single_predict(self, prev_xpt: np.ndarray, prev_cov: np.ndarray, A, Q):
        xpt = np.matmul(A, prev_xpt[0:4])
        cov = np.matmul(A, np.matmul(prev_cov, A.T)) + Q
        return xpt, cov

    def __single_update(self, pred_xpt: np.ndarray, pred_cov: np.ndarray, z: np.ndarray, pred_z: np.ndarray, H, R):
        S = np.matmul(H, np.matmul(pred_cov, H.T)) + R
        K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(S)))
        xpt = pred_xpt + np.matmul(K, (z - pred_z))
        cov = pred_cov - np.matmul(np.matmul(K, H), pred_cov)
        return xpt, cov

    def __single_radar_comparison(self, pred_xpt: np.ndarray, z: np.ndarray):
        pred_z = self.__h_radar(pred_xpt)
        d = np.linalg.norm(z - pred_z)
        print("\033[1;31mCMP Radar (z/pz):\033[0m", z, pred_z)
        return d

    def __single_image_comparison(self, pred_xpt: np.ndarray, z: np.ndarray):
        pred_z = self.__h_image(pred_xpt)
        d = np.linalg.norm(z - pred_z)
        print("\033[1;31mCMP Image (z/pz):\033[0m", z, pred_z)
        return d

    def __single_match_comparison(self, pred_xpt: np.ndarray, z: np.ndarray):
        d1 = self.__single_radar_comparison(pred_xpt, z[0:3])
        d2 = self.__single_image_comparison(pred_xpt, z[3:5])
        d = d1 * self.WEIGHT_RADAR + d2 * self.WEIGHT_IMAGE
        return d

    def bulk_predict(self, A, Q):
        p0 = list(map(lambda x, c: self.__single_predict(x, c, A, Q), self.xpt_pile, self.cov_pile))
        self.pred_xpt_pile = [xpt for xpt, _ in p0]
        self.pred_cov_pile = [cov for _, cov in p0]

    def bulk_comparison(self, zms: np.ndarray, zrs: np.ndarray, zis: np.ndarray):
        # row -> xpts, col -> zs
        xpt_num = len(self.pred_xpt_pile)
        z_num = len(zms) + len(zrs) + len(zis)
        cmp_match = np.array([self.__single_match_comparison(x, z) for x in self.pred_xpt_pile for z in zms]).reshape(xpt_num, len(zms))
        cmp_radar = np.array([self.__single_radar_comparison(x, z) for x in self.pred_xpt_pile for z in zrs]).reshape(xpt_num, len(zrs))
        cmp_image = np.array([self.__single_image_comparison(x, z) for x in self.pred_xpt_pile for z in zis]).reshape(xpt_num, len(zis))
        # cmp = np.concatenate((cmp_match, cmp_radar, cmp_image), axis=1)
        cmp = cmp_radar
        print("Bulk Comparison:", cmp)
        row_idx, col_idx = linear_sum_assignment(cmp)
        # threshold filter
        fil = cmp[row_idx, col_idx] < self.THRESHOLD
        row_idx = np.extract(fil, row_idx)
        lost_idx = np.setdiff1d(np.arange(xpt_num), row_idx)
        col_idx = np.extract(fil, col_idx)
        new_idx = np.setdiff1d(np.arange(z_num), col_idx)
        # existing objs, lost objs, new objs
        return (row_idx, col_idx), lost_idx, new_idx

    def bulk_update(self, exist_idx: np.ndarray, zms: np.ndarray, zrs: np.ndarray, zis: np.ndarray):
        for pred_idx, z_idx in zip(exist_idx[0], exist_idx[1]):
            pred_xpt = self.pred_xpt_pile[pred_idx]
            pred_cov = self.pred_cov_pile[pred_idx]
            if z_idx < len(zms):
                # match
                H = self.__H_match(self.pred_xpt_pile[pred_idx])
                z = zms[z_idx]
                pred_z = self.__h_match(pred_xpt)
                R = 10 * np.eye(5)
            elif z_idx < len(zms) + len(zrs):
                # radar
                H = self.__H_radar(self.pred_xpt_pile[pred_idx])
                z = zrs[z_idx - len(zms)]
                pred_z = self.__h_radar(pred_xpt)
                R = 10 * np.eye(3)
            else:
                # image
                continue
                H = self.__H_image(self.pred_xpt_pile[pred_idx])
                z = zis[z_idx - len(zms) - len(zrs)]
                pred_z = self.__h_image(pred_xpt)
                R = 10 * np.eye(2)
            xpt, cov = self.__single_update(pred_xpt, pred_cov, z, pred_z, H, R)
            age = self.xpt_pile[pred_idx][4] + 1
            if age > self.MAX_AGE:
                age = self.MAX_AGE
            self.xpt_pile[pred_idx] = np.concatenate((xpt, [age, self.xpt_pile[pred_idx][5]])) 
            self.cov_pile[pred_idx] = cov

    def bulk_lost(self, lost_idx: np.ndarray):
        for i in lost_idx:
            self.xpt_pile[i][4] -= 1
        i, m = 0, len(self.xpt_pile)
        while(i < m):
            if self.xpt_pile[i][4] < 0:
                self.xpt_pile.pop(i)
                self.cov_pile.pop(i)
                m = m - 1
            else:
                i = i + 1

    def bulk_new(self, new_idx: np.ndarray, zms: np.ndarray, zrs: np.ndarray, zis: np.ndarray):
        for i in new_idx:
            if i < len(zms):
                # match
                x = np.array([-1.375, 0.5, 0, 0, 0, self.max_id])
            elif i < len(zms) + len(zrs):
                # radar
                zr = zrs[i - len(zms)]
                xw = self.radar_pos[0] - zr[0] * np.sin(zr[1] * np.pi / 180)
                yw = self.radar_pos[1] + zr[0] * np.cos(zr[1] * np.pi / 180)
                x = np.array([xw, yw, 0, 0, 0, self.max_id])
            else:
                # image
                continue
                x = np.array([-1.375, 0.5, 0, 0, 0, self.max_id])
            self.xpt_pile.append(x)
            self.cov_pile.append(np.full((4, 4), 1e6))
            self.max_id += 1

    def output(self):
        pass
        # print("State Xpts:", self.xpt_pile, sep='\n')
        # print("State Covs:", self.cov_pile, sep='\n')

    def all_in_one(self, A: np.ndarray, Q: np.ndarray, zms: np.ndarray, zrs: np.ndarray, zis: np.ndarray):
        self.bulk_predict(A, Q)
        exist_idx, lost_idx, new_idx = self.bulk_comparison(zms, zrs, zis)
        print("\033[1;36mKalman Filter\033[0m")
        print("State Vectors:")
        for x in self.xpt_pile:
            print(x)
        print("Matched Observation:\t", zms)
        print("Radar Observation:  \t", zrs)
        print("Image Observation:  \t", zis)
        print("Exist Indices: (s/o)\t", exist_idx)
        print("Lost Indices:  (s)  \t", lost_idx)
        print("New Indices:   (o)  \t", new_idx)
        self.bulk_update(exist_idx, zms, zrs, zis)
        self.bulk_lost(lost_idx)
        self.bulk_new(new_idx, zms, zrs, zis)
