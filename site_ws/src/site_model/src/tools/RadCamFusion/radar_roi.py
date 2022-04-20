#############################################################
#   This py file generate the roi of radar detection.       #
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
    calib_dir = config['calib']['calib_dir']
    output_dir = config['output']['RadCamFusion_dir']
    os.makedirs(output_dir,exist_ok=True)

    # get calib parameters
    calib = np.loadtxt(calib_dir+'calib.txt')

    # get radar msgs
    size, x_poses, y_poses = get_radar_pts(data_rad_dir)

    # get pixel points
    world_pose = [[x_poses[0]],[y_poses[0]],[0.46],[1]]
    pixel_pose = get_pixel_pose(calib,"pole2","camera2",world_pose)
    print("pixel_pose:")
    print(pixel_pose)

    for i in range(size):
        fname = data_cam_dir+'image2.jpg'
        img = cv2.imread(fname)

        # location of detection on the image unit pixel
        x_pixel = round(pixel_pose[0][0])
        y_pixel = round(pixel_pose[1][0])

        # draw dot
        pt1 = (x_pixel-2,y_pixel-2)
        pt2 = (x_pixel+2,y_pixel+2)
        cv2.rectangle(img, pt1, pt2, (0, 0, 255), 3)

        # draw roi
        pt1 = (x_pixel-50, 0) #left,up=num1,num2
        pt2 = (x_pixel+50, 479) #right,down=num1+num3,num2+num4
        cv2.rectangle(img, pt1, pt2, (0, 255, 0), 1) # color and thickness of box
        
        label = 'vehicle'
        score = 0.596
        font = cv2.FONT_HERSHEY_SIMPLEX  # 定义字体
        img = cv2.putText(img, '{} {:.3f}'.format(label,score), (100, 100), font, 0.5, (0, 255, 255), 2)
                            # img               content         坐标(右上角坐标)    font size   color   thickness
        
    # save results
    cv2.imwrite(output_dir+'image2.jpg', img)

def get_radar_pts(data_rad_dir: string):
    """
         size: number of vehicles
         x_poses, y_poses: array of x,y coordinates in world coordinates of vehicles
    """
    data = np.loadtxt(data_rad_dir+'data20220419 232258.txt')
    size = data.ndim # num of vechicles
    print(size)
    if size==1:
        x_poses = data[1:2]
        y_poses = data[2:3]
    else:
        x_poses = data[:,1:2]
        y_poses = data[:,2:3]
    return size, x_poses, y_poses

def get_pixel_pose(calib: np.array, pole_name: string, camera_name: string, world_pose: np.array):
    """
        world_pose -> camera_pose : external parameter of camera
        camera_pose -> pixel_pose : internal parameter of camera
        tips: shift is need between external and internal parameter
    """
    # get external and internal parameter of camera
    world_to_camera = calib[4][1:17].reshape(4,4)
    camera_to_pixel = calib[4][17:30].reshape(3,4)

    # coordinates in camera coordinates
    camera_pose = np.matmul(world_to_camera, world_pose)
    instance = camera_pose[0]
    
    # shift the coordinates
    camera_pose_shift = [camera_pose[1],
                        camera_pose[2],
                       -camera_pose[0],
                       -instance] / (-instance)

    # coordinates in pixel coordinates
    pixel_pose = np.matmul(camera_to_pixel, camera_pose_shift)

    return pixel_pose

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