import os
import numpy as np
from pathlib import Path
from ..utils.visualization import heat_map


def main(data: np.array):
    heat_map(data)


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    data_dir = os.path.join(str(ROOT_DIR), 'src/LidCamFusion/eval/20220819-193953/heat_map.txt')
    data = np.loadtxt(data_dir)
    main(data)