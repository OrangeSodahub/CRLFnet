# !usr/bin/env python3

from pathlib import Path
from PIL import Image
import yaml
import numpy as np

from ..utils.yolo.yolo import YOLO

if __name__ == '__main__':

    ROOT_DIR = Path(__file__).resolve().parents[2]
    YOLO_DIR = ROOT_DIR.joinpath("src/utils/yolo")
    CONFIG_FILE = ROOT_DIR.joinpath("config/config.yaml")
    with open(CONFIG_FILE, 'r') as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    OUTPUT_DIR = ROOT_DIR.joinpath(config['output']['RadCamFusion_dir'])
    SAVE_DIR = OUTPUT_DIR.joinpath("save")
    LOAD_DIR = OUTPUT_DIR.joinpath("load")
    LOAD_DIR.mkdir(exist_ok=True)

    yolo = YOLO(YOLO_DIR, config['use_cuda'])
    for frame in SAVE_DIR.iterdir():
        for file in frame.iterdir():
            if file.suffix == '.png':
                image = Image.open(file)
                boxes = yolo.detect_image(image)
                txt_pth = frame.joinpath("{}.txt".format(file.stem))
                np.savetxt(txt_pth, boxes, fmt='%d')
        print('Finished frame {}    '.format(frame.stem))
    print("\033[0;32mFinished all frames.\033[0m")
