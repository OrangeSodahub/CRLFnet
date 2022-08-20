import os
import numpy as np
import copy
from pathlib import Path
from ..utils.visualization import heat_map, contour, contour_heat


def main(data: np.array, img_dir: str):
    # contour_heat(data)
    contour(data, img_dir)
    # heat_map(data)


def mean(data: np.array, i: int, j: int):
    sum = 0
    counter = 0
    dirs = [[1,0],[-1,0],[0,1],[0,-1],[-1,-1],[-1,1],[1,1],[1,-1]]
    for dir in dirs:
        newi = i + dir[0]
        newj = j + dir[1]
        if(newi >=0 and newi < len(data) and newj >=0 and newj < len(data[i])):
            sum += data[newi][newj]
            counter += 1
    return sum/counter


def process(data_origin: np.array):
    data = copy.deepcopy(data_origin)
    for i in range(len(data)):
        for j in range(len(data[i])):
            if data[i][j] == 0:
                data[i][j] = 0.12
    for i in range(len(data)):
        for j in range(len(data[i])):
            data[i][j] = mean(data, i, j)
    return data


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    data_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220820-110456/heat_map_pose.txt')
    img_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220820-110456/heat_map_pose.png')
    data_origin = np.loadtxt(data_dir)
    data = process(data_origin)
    main(data, img_dir)