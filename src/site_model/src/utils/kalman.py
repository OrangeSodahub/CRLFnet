#!/usr/bin/env python3

"""
Kalman Filter
"""


import numpy as np
from scipy.optimize import linear_sum_assignment

from .transform import w2p


class KalmanFilter:
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
        K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(np.matmul(H, np.matmul(pred_cov, H.T)) + R)))
        print(K)
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
