#!/usr/bin/env python3

"""
Kalman Filter
"""


import numpy as np

from .poi_and_roi import simple_radar_roi, get_iou


_A_DEFAULT = np.array([[1, 0, 1, 0], [0, 1, 0, 1], [0, 0, 1, 0], [0, 0, 0, 1]])
_H_DEFAULT = np.eye(4)
_Q_DEFAULT = 1e-3 * np.eye(4)
_R_DEFAULT = 0.1 * np.eye(4)

_THRESHOLD_RADAR = 0.1
_THRESHOLD_IMAGE = 1 - 0.6


def _single_predict(prev_xpt: np.ndarray, prev_cov: np.ndarray, A=_A_DEFAULT, Q=_Q_DEFAULT):
    xpt = np.matmul(A, prev_xpt)
    cov = np.matmul(A, np.matmul(prev_cov, A.T)) + Q
    return xpt, cov


def _single_update(pred_xpt: np.ndarray, pred_cov: np.ndarray, z: np.ndarray, H=_H_DEFAULT, R=_R_DEFAULT):
    K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(np.matmul(H, np.matmul(pred_cov, H.T)) + R)))
    xpt = pred_xpt + np.matmul(K, (z - np.matmul(H, pred_xpt)))
    cov = pred_cov - np.matmul(np.matmul(K, H), pred_cov)
    return xpt, cov


_single_radar_comparison = lambda pred_xpt, z: np.square(pred_xpt[0] - z[0]) + np.square(pred_xpt[1] - z[1])

_single_image_comparison = lambda pred_xpt, z, w2c, c2p: 1 - get_iou(simple_radar_roi(pred_xpt, w2c, c2p), z)


def bulk_predict(prev_xpt_pile: np.ndarray, prev_cov_pile: np.ndarray, A=_A_DEFAULT, Q=_Q_DEFAULT):
    p0 = map(lambda x, c: _single_predict(x, c, A, Q), prev_xpt_pile, prev_cov_pile)
    return np.array(list(p0))


def bulk_comparison(pred_xpt_pile: np.ndarray, zms, zrs, zis, w2c, c2p):
    pass    # TODO: GNN
    '''
    # state_xpt = (Xw, Yw, Vxw, Vyw, status, comparison_flag)
    # -3 <= status <= 3
    # 0 means it is a new object.
    # +x means it has been existing for x times.
    # -x means it has been lost for x times.
    pred_xpt_pile[:, 6] = 0
    for zr, zi in zms:
        flagless_xpts = pred_xpt_pile[pred_xpt_pile[:, 6] != 0, :]
        
    return pred_xpt_pile
    '''


def bulk_update(pred_xpt_pile, pred_cov_pile):
    pass
