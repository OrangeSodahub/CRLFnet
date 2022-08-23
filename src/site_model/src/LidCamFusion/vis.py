import os
import numpy as np
import copy
from pathlib import Path
from ..utils.visualization import heat_map, contour, contour_heat, draw_pr_line


def main(data: np.array):
    # contour_heat(data)
    contour(data)
    # heat_map(data)


def mean(data: np.array, i: int, j: int):
    sum = 0
    counter = 0
    dirs = [[1,0],[-1,0],[0,1],[0,-1]]
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
            data[i][j] = mean(data, i, j)
    # for i in range(len(data)):
    #     for j in range(len(data[i])):
    #         data[i][j] /= 2
    return data


def calc_mean(data: np.array):
    sum = 0
    counter = 0
    for i in range(len(data)):
        for j in range(len(data[i])):
            if data[i][j] != 0:
                sum += data[i][j]
                counter += 1
    return sum/counter


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    # data_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220820-110456/heat_map_alpha.txt')
    data_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220822-034113/heat_map_alpha_similarity.txt')
    # txt_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220820-110456/tp_fp_fn.txt')
    data_origin = np.loadtxt(data_dir)
    print(calc_mean(data_origin))
    # data = process(data_origin)
    # main(data)
    # draw_pr_line(txt_dir)