# !/usr/bin/env python3
"""
Kalman Filter

Some Abbr.:
pred    ->  predicted
obs / z ->  observation
zs      ->  observations
xpt(s)  ->  expectation / mean vector(s)
cov(s)  ->  covarience matirx (matrices)
idx     ->  index / indices
rmv     ->  remove
"""

import numpy as np
from scipy.optimize import linear_sum_assignment

from .sensor_and_obs import ObsBundle


class Kalman:

    def __init__(self, size: int, Q: np.ndarray, threshold: float, max_age: int) -> None:
        self.xpts = np.empty((0, size + 2))
        self.covs = np.empty((0, size, size))
        self.total_objs = 0
        self.max_id = 0

        self.size = size
        self.Q = Q
        self.THRESHOLD = threshold
        self.MAX_AGE = max_age

    def predict(self, A: np.ndarray) -> tuple:
        pred_xpts = np.matmul(self.xpts[:, 0:self.size], A.T)
        pred_covs = np.matmul(A, np.matmul(self.covs, A.T)) + np.tile(self.Q, (self.total_objs, 1, 1))
        return pred_xpts, pred_covs

    def compare(self, pred_xpts: np.ndarray, zs: ObsBundle) -> tuple:
        # generate comparison matrix
        cmp = [np.linalg.norm(x - zx) for x in pred_xpts[:, 0:2] for zx in zs.projections]
        cmp = np.array(cmp).reshape(self.total_objs, zs.total_objs)
        # GNN
        xpt_idx, obs_idx = linear_sum_assignment(cmp)
        thres_filter = cmp[xpt_idx, obs_idx] < self.THRESHOLD
        # get index(indices) of objects form different sources
        xpt_idx = np.extract(thres_filter, xpt_idx)  # pred_xpts, existing object(s)
        rmv_idx = np.setdiff1d(np.arange(self.total_objs), xpt_idx)  # pred_xpts, lost object(s)
        obs_idx = np.extract(thres_filter, obs_idx)  # zs.projections, existing object(s)
        new_idx = np.setdiff1d(np.arange(zs.total_objs), obs_idx)  # zs.projections, new object(s)
        return xpt_idx, obs_idx, rmv_idx, new_idx

    def update(self, pred_xpts: np.ndarray, pred_covs: np.ndarray, zs: ObsBundle, xpt_idx: np.ndarray,
               obs_idx: np.ndarray) -> None:
        for xi, zi in zip(xpt_idx, obs_idx):
            sensor = zs.sensors[zi]
            pred_xpt = pred_xpts[xi]
            pred_cov = pred_covs[xi]
            pred_z = sensor.world2obs(pred_xpt)
            z = zs.zs[zi]
            H = sensor.H(pred_xpt)
            R = sensor.R
            S = np.matmul(H, np.matmul(pred_cov, H.T)) + R
            K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(S)))

            p = np.trace(S) / np.sum(np.square(z - sensor.world2obs(pred_xpt)))
            if p < 1e10:
                print("\033[1;32mInnovation Inequality", p, "\033[0m")
            else:
                print("\033[1;31mInnovation Inequality", p, "\033[0m")
                pred_cov = (pred_cov - self.Q) / p + self.Q
                S = np.matmul(H, np.matmul(pred_cov, H.T)) + R
                K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(S)))

            xpt = pred_xpt + np.matmul(K, (z - pred_z))
            cov = pred_cov - np.matmul(np.matmul(K, H), pred_cov)
            self.xpts[xi, 0:self.size] = xpt
            self.covs[xi] = cov

    def remove(self, xpt_idx: np.ndarray, rmv_idx: np.ndarray) -> None:
        x1 = self.xpts[xpt_idx, self.size]
        self.xpts[xpt_idx, self.size] = np.where(x1 < self.MAX_AGE, x1 + 1, self.MAX_AGE)
        self.xpts[rmv_idx, self.size] -= 1
        # remove lost objects
        remaining_idx = np.argwhere(self.xpts[:, self.size] >= 0)[:, 0]
        self.total_objs = len(remaining_idx)
        self.xpts = self.xpts[remaining_idx]
        self.covs = self.covs[remaining_idx]

    def create(self, zs: ObsBundle, new_idx: np.ndarray) -> None:
        new_objs = len(new_idx)
        new_xpts = np.concatenate([
            zs.projections[new_idx],
            np.zeros((len(new_idx), 1)),
            np.expand_dims(np.arange(self.max_id, self.max_id + new_objs), axis=1)
        ],
                                  axis=1)
        new_covs = np.full((new_objs, self.size, self.size), 1e6)
        self.xpts = np.concatenate([self.xpts, new_xpts], axis=0)
        self.covs = np.concatenate([self.covs, new_covs], axis=0)
        self.max_id += new_objs
        self.total_objs += new_objs

    def flush(self, A: np.ndarray, zs: ObsBundle) -> None:
        pred_xpts, pred_covs = self.predict(A)
        xpt_idx, obs_idx, rmv_idx, new_idx = self.compare(pred_xpts, zs)
        self.update(pred_xpts, pred_covs, zs, xpt_idx, obs_idx)
        self.remove(xpt_idx, rmv_idx)
        self.create(zs, new_idx)

    def output(self) -> np.ndarray:
        # TODO: Match the input of the dispatch system
        return self.xpts[:, 0:self.size]

    def __repr__(self) -> str:
        if self.total_objs == 0:
            return "Objects (0)"
        else:
            return "Objects ({}):\n{}".format(self.total_objs, self.xpts)
