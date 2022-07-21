#!/usr/bin/env python3

"""
Kalman Filter
"""


from tkinter import OFF
from cv2 import norm
import numpy as np
from scipy.optimize import linear_sum_assignment

from .transform import w2p


_Q_DEFAULT = 1e-2 * np.eye(4)

_THRESHOLD = 1e4
_WEIGHT_RADAR = 0.7
_WEIGHT_IMAGE = 0.3

OFFSET = np.array([-1.374, -1.176])
HEIGHT = 0.461


def get_H_radar(pred_xpt: np.ndarray, offset):
    r = np.linalg.norm(pred_xpt[0:2] - offset[0:2])
    c = (pred_xpt[1] - offset[1]) / r
    s = (pred_xpt[0] - offset[0]) / r
    vn = pred_xpt[2] * c - pred_xpt[3] * s
    Hr = np.array([[-s, c, 0, 0],
                   [-c / r, -s / r, 0, 0],
                   [(pred_xpt[2] - vn * s) / r, (pred_xpt[3] - vn * c) / r, -s, c]])
    return Hr


def get_H_image(pred_xpt: np.ndarray, w2c, c2p):
    uv, zc = w2p(np.array([pred_xpt[0], pred_xpt[1], HEIGHT, 1]), w2c, c2p)
    m0 = np.concatenate((np.matmul(c2p, w2c)[0:2, 0:2], np.zeros(shape=(2, 2))), axis=1)
    m1 = np.outer(uv[0:2], [w2c[2, 0], w2c[2, 1], 0, 0])
    Hi = (m0 - m1) / zc
    return Hi


get_H_match = lambda pred_xpt, w2c, c2p: np.concatenate((get_H_radar(pred_xpt, OFFSET), get_H_image(pred_xpt, w2c, c2p)))


def _single_predict(prev_xpt: np.ndarray, prev_cov: np.ndarray, A, Q=_Q_DEFAULT):
    xpt = np.matmul(A, prev_xpt[0:4])
    cov = np.matmul(A, np.matmul(prev_cov, A.T)) + Q
    return xpt, cov


def _single_update(pred_xpt: np.ndarray, pred_cov: np.ndarray, z: np.ndarray, H, R):
    K = np.matmul(pred_cov, np.matmul(H.T, np.linalg.inv(np.matmul(H, np.matmul(pred_cov, H.T)) + R)))
    xpt = pred_xpt + np.matmul(K, (z - np.matmul(H, pred_xpt)))
    cov = pred_cov - np.matmul(np.matmul(K, H), pred_cov)
    return xpt, cov


def _single_radar_comparison(pred_xpt: np.ndarray, z: np.ndarray, offset: np.ndarray):
    x, y, vx, vy = pred_xpt[0] - offset[0], pred_xpt[1] - offset[1], pred_xpt[2], pred_xpt[3]
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
    print("\033[0;31mCMP, Radar:\033[0m", z, zp)
    d = np.linalg.norm(z - zp)
    return d


def _single_image_comparison(pred_xpt: np.ndarray, z: np.ndarray, w2c, c2p):
    pos = np.array([pred_xpt[0], pred_xpt[1], HEIGHT, 1])
    zp, _ = w2p(pos, w2c, c2p)
    zp = zp[0:2]
    print("\033[0;31mCMP, Image:\033[0m", z, zp)
    d = np.linalg.norm(z - zp)
    return d


def _single_match_comparison(pred_xpt: np.ndarray, z: np.ndarray, offset: np.ndarray, w2c, c2p):
    d1 = _single_radar_comparison(pred_xpt, z[0:3], offset)
    d2 = _single_image_comparison(pred_xpt, z[3:5], w2c, c2p)
    d = d1 * _WEIGHT_RADAR + d2 * _WEIGHT_IMAGE
    return d


def bulk_predict(prev_xpt_pile: list, prev_cov_pile: list, A, Q=_Q_DEFAULT):
    p0 = list(map(lambda x, c: _single_predict(x, c, A, Q), prev_xpt_pile, prev_cov_pile))
    return [xpt for xpt, _ in p0], [cov for _, cov in p0]


def bulk_comparison(pred_xpt_pile, zms, zrs, zis, w2c, c2p, offset=OFFSET):
    # row -> xpts, col -> zs
    xpt_num = len(pred_xpt_pile)
    z_num = len(zms) + len(zrs) + len(zis)
    cmp_match = np.array([_single_match_comparison(x, z, offset, w2c, c2p) for x in pred_xpt_pile for z in zms]).reshape(xpt_num, len(zms))
    cmp_radar = np.array([_single_radar_comparison(x, z, offset) for x in pred_xpt_pile for z in zrs]).reshape(xpt_num, len(zrs))
    cmp_image = np.array([_single_image_comparison(x, z, w2c, c2p) for x in pred_xpt_pile for z in zis]).reshape(xpt_num, len(zis))
    cmp = np.concatenate((cmp_match, cmp_radar, cmp_image), axis=1)
    print("Bulk Comparison:", cmp)
    row_idx, col_idx = linear_sum_assignment(cmp)
    # threshold filter
    fil = cmp[row_idx, col_idx] < _THRESHOLD
    row_idx = np.extract(fil, row_idx)
    lost_idx = np.setdiff1d(np.arange(xpt_num), row_idx)
    col_idx = np.extract(fil, col_idx)
    new_idx = np.setdiff1d(np.arange(z_num), col_idx)
    # existing objs, lost objs, new objs
    return (row_idx, col_idx), lost_idx, new_idx


def bulk_update(exist_idx, state_xpt_pile, state_cov_pile, pred_xpt_pile, pred_cov_pile, zms, zrs, zis, w2c, c2p, offset=OFFSET):
    for pred_idx, z_idx in zip(exist_idx[0], exist_idx[1]):
        if z_idx < len(zms):
            # match
            H = get_H_match(pred_xpt_pile[pred_idx], w2c, c2p)
            z = zms[z_idx]
            R = 0.1 * np.eye(5)
        elif z_idx < len(zms) + len(zrs):
            # radar
            H = get_H_radar(pred_xpt_pile[pred_idx], offset)
            z = zrs[z_idx - len(zms)]
            R = 0.1 * np.eye(3)
        else:
            # image
            H = get_H_image(pred_xpt_pile[pred_idx], w2c, c2p)
            z = zis[z_idx - len(zms) - len(zrs)]
            R = 0.1 * np.eye(2)
        xpt, cov = _single_update(pred_xpt_pile[pred_idx], pred_cov_pile[pred_idx], z, H, R)
        age = state_xpt_pile[pred_idx][4] + 1
        if age > 3:
            age = 3
        state_xpt_pile[pred_idx] = np.concatenate((xpt, [age, state_xpt_pile[pred_idx][5]])) 
        state_cov_pile[pred_idx] = cov


def bulk_lost(lost_idx, state_xpt_pile, state_cov_pile):
    for i in lost_idx:
        state_xpt_pile[i][4] -= 1
    i, m = 0, len(state_xpt_pile)
    while(i < m):
        if state_xpt_pile[i][4] < 0:
            state_xpt_pile.pop(i)
            state_cov_pile.pop(i)
            m = m - 1
        else:
            i = i + 1


def bulk_new(new_idx, state_xpt_pile, state_cov_pile, zms, zrs, zis, max_id):
    for i in new_idx:
        if i < len(zms):
            # match
            x = np.array([-1.3, -1.5, 0, 0, 0, max_id])
        elif i < len(zms) + len(zrs):
            # radar
            x = np.array([-1.3, -1.5, 0, 0, 0, max_id])
        else:
            # image
            x = np.array([-1.3, -1.5, 0, 0, 0, max_id])
        state_xpt_pile.append(x)
        state_cov_pile.append(np.full((4, 4), 1e6))
        max_id += 1
    return max_id


def bulk_output():
    pass
