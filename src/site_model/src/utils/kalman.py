#!/usr/bin/env python3

"""
Kalman Filter
"""


from pykalman import KalmanFilter
import numpy as np
import matplotlib.pyplot as plt


N = 200
OMEGA = 0.05
COVX, COVY, COVVX, COVVY = 0.05, 0.05, 0.1, 0.1
A = np.array([[1, 0, 1, 0], [0, 1, 0, 1], [0, 0, 1, 0], [0, 0, 0, 1]])
H = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
Q = 1e-4 * np.eye(4)
R = np.diag([COVX, COVY, COVVX, COVVY])

kf = KalmanFilter(transition_matrices=A, observation_matrices=H,
                  transition_covariance=Q, observation_covariance=R)
xpt = np.array([1, 0, 0, 0])
cov = np.full((4, 4), 1e6)

lobsx, lobsy = [], []
loptx, lopty = [], []

for n in range(N):
    obs = [np.cos(OMEGA * n) + np.random.normal(loc=0.0, scale=COVX),
           np.sin(OMEGA * n) + np.random.normal(loc=0.0, scale=COVY),
           -OMEGA * np.sin(OMEGA * n) + np.random.normal(loc=0.0, scale=COVVX),
           OMEGA * np.cos(OMEGA * n) + np.random.normal(loc=0.0, scale=COVVY)]
    xpt, cov = kf.filter_update(xpt, cov, obs)
    lobsx.append(obs[0])
    lobsy.append(obs[1])
    loptx.append(xpt[0])
    lopty.append(xpt[1])

plt.plot(lobsx, lobsy, linestyle='', marker='.')
plt.plot(loptx, lopty)
plt.show()

