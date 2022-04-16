#############################################################
#   This py file generate the roi of radar detection        #
#   Author: Yangxiuyu                                       #
#############################################################

import argparse
from cProfile import label
import numpy as np
from tomlkit import string
import rospy
from termcolor import colored
import yaml
import cv2
import os

def main(config: dict):
    # load data and set output dir
    data_cam_dir = config['data']['cam_dir']
    data_rad_dir = config['data']['rad_dir']
    output_dir = config['output']['RadCamFusion_dir']
    os.makedirs(output_dir,exist_ok=True)

    # get radar
    radar2_topic = config['topic']['radar_2']
    pole2_to_world = config['calib']['pole2_to_world']
    radar2_to_pole2 = config['calib']['radar2_to_pole2']
    print(pole2_to_world+radar2_to_pole2)
    size, x_poses, y_poses = get_radar_pts(data_rad_dir)

    for i in range(size):
        fname = data_cam_dir+'image2.jpg'
        img = cv2.imread(fname)

        # draw boxes
        pt1 = (200, 0) #left,up=num1,num2
        pt2 = (200+100, 480) #right,down=num1+num3,num2+num4
        cv2.rectangle(img, pt1, pt2, (0, 255, 0), 2) # color and thickness of box
        
        label = 'vehicle'
        score = 0.596
        font = cv2.FONT_HERSHEY_SIMPLEX  # 定义字体
        img = cv2.putText(img, '{} {:.3f}'.format(label,score), (10, 10), font, 1, (0, 255, 255), 4)
                            # img               content         坐标(右上角坐标)    font size   color   thickness
        
    # save results
    cv2.imwrite(output_dir+'image2.jpg', img)

def get_radar_pts(data_rad_dir: string):
    data = np.loadtxt(data_rad_dir+'data20220415 230928.txt')
    size = data.ndim # num of vechicles
    print(size)
    if size==1:
        x_poses = data[1:2]
        y_poses = data[2:3]
    else:
        x_poses = data[:,1:2]
        y_poses = data[:,2:3]
    print(data)
    print(x_poses)
    print(y_poses)
    return size, x_poses, y_poses

if __name__=='__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default="/home/zonlin/IPP_WorkSpace/ROS_WS/site_ws/src/site_model/config/config.yaml")
    args = parser.parse_args()

    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f,Loader=yaml.FullLoader)

        except:
            print(colored('Config file could not be read','red'))
            exit(1)
        
        main(config)
        print(colored('Finished successfully', 'green'))