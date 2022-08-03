import os
from unicodedata import name
from defer import return_value
import numpy as np
import open3d as o3d
path = '/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/point_cloud_data/pcd/filtered'

def get_num(i: int):
    if i < 10:
        num = '00000' + str(i) + '.pcd'
    elif i < 100:
        num = '0000' + str(i) + '.pcd'
    elif i < 1000:
        num = '000' + str(i) + '.pcd'
    elif i < 10000:
        num = '00' + str(i) + '.pcd'
    return num

for i in range(850):
    num = get_num(i)
    file = os.path.join(path, num)
    pcd = o3d.io.read_point_cloud(file)
    points = np.asarray(pcd.points)
    print(points.shape)
