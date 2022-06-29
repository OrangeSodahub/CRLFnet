#!/usr/bin/env python3

#############################################################
#   This py file get the lidar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################

import argparse
import parser
import yaml
import rospy
from termcolor import colored
import message_filters
# pointcloud type
from sensor_msgs.msg import PointCloud2
import ros_numpy
# Image type
from msgs.msg._MsgCamera import * # camera msgs class
# odometry type
from nav_msgs.msg import Odometry
# Object Detection tool
from OpenPCDet.tools.pred import *
# pointcloud detection
import pointcloud_roi
# vision detection
import sys
sys.path.append("../")
# from tools.RadCamFusion.yolo.yolo import YOLO
# from tools.RadCamFusion import image_roi
# fusion message type
# from msgs.msg._MsgLidCam import *
# visualization
from utils import visualization, evaluation


def fusion(pointcloud, msgcamera, odom=None):
    """
        pointcloud: [N,4]
        msgcamera: [1,8] -> eight Images
    """
    assert isinstance(pointcloud, PointCloud2)
    assert isinstance(msgcamera, MsgCamera)
    global time_span, counter, start_time

    # image roi
    # pred_boxes2d = []
    # for img in msgcamera.camera:
    #     pred_boxes2d.append(image_roi.image_roi(img, yolo))

    # pointcloud roi
    points = convert_ros_pointcloud_to_numpy(pointcloud)
    pred_boxes3d, pred_labels, pred_scores = pointcloud_detector.get_pred_dicts(points, False)


    # post-process the predict results
    if len(pred_boxes3d) != 0:

        # pred results eval: BEV (for one car)
        if odom is not None:
            global alpha_diff, pose_diff
            alpha_diff, pose_diff = evaluation.eval3d(odom, pred_boxes3d, logger, counter, alpha_diff, pose_diff)
        
        # print pred results to screen
        if params.print2screen:
            print2screen(pred_boxes3d, pred_labels, pred_scores)

        # get cameras and pixel_poses of all vehicles
        cameras, pixel_poses = pointcloud_roi.pointcloud_roi(ROOT_DIR, config, pred_boxes3d)

        # visualize lidar detection boxes to pixel
        if params.draw_output:
            output_dir = ROOT_DIR + config['output']['LidCamFusion_dir']
            visualization.lidar2visual(cameras, pixel_poses, msgcamera, output_dir)

    # # fusion
    # msglidcam = MsgLidCam()
    # msglidcam.header.stamp = rospy.Time.now()

    # # publish result
    # pub = rospy.Publisher("/lidar_camera_fused", MsgLidCam)
    # pub.publish(msglidcam)

    # fps evalution (without results evalution and visualization)
    cur_time = time.time()
    time_span += cur_time - start_time
    start_time = cur_time
    counter += 1
    fps = (counter-1) / time_span
    print('FPS: ', fps)
    

def convert_ros_pointcloud_to_numpy(pointcloud: PointCloud2):
    pc = ros_numpy.numpify(pointcloud)
    points = np.zeros((pc.shape[0],4))
    points[:,0] = pc['x']
    points[:,1] = pc['y']
    points[:,2] = pc['z']

    return points


def print2screen(pred_boxes3d, pred_labels, pred_scores):
    label2class = {1: 'Car', 2: 'Pedstrain', 3: 'Bicycle' }
    print("+-------------------------------------------------------------------------------------------+")
    print("num_car: ", len(pred_boxes3d))
    for i in range(len(pred_boxes3d)):
        print(i+1, " ==> ", label2class[int(pred_labels[i])], "  score: ", pred_scores[i])
        print("  ", pred_boxes3d[i][0:3], " ", pred_boxes3d[i][3:6], " ", pred_boxes3d[i][6])
    print("+-------------------------------------------------------------------------------------------+\n")


if __name__ == '__main__':
    # get root path
    from pathlib import Path
    ROOT_DIR = str((Path(__file__).resolve().parent / '../../').resolve())
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= ROOT_DIR + '/config/config.yaml')
    parser.add_argument("--draw_output", help="wehter to draw rois and output", action='store_true', required=False)
    parser.add_argument("--print2screen", help="wehter to print to screen", action='store_true', required=False)
    parser.add_argument("--eval", help="wehter to eval", action='store_true', required=False)
    params = parser.parse_args()

    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    rospy.init_node('lidar_camera_fusion', anonymous=True)

    # fps evaluation
    counter = 1
    time_span = 0
    fps = 0

    # Create an example of pointcloud detector
    pointcloud_detector = RT_Pred(ROOT_DIR, config)
    # Create YOLO detector
    # yolo = YOLO()

    sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)

    if params.eval:
        # logger
        from tensorboard_logger import Logger
        import datetime
        import os
        log_dir = ROOT_DIR+'/src/LidCamFusion/eval/%s/' % datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
        os.makedirs(log_dir, exist_ok=True)
        logger = Logger(logdir=log_dir, flush_secs=10)
        # pointcloud pred results evaluation
        alpha_diff = 0
        pose_diff = 0
        
        sub_odom = message_filters.Subscriber('//base_pose_ground_truth', Odometry)
        sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera, sub_odom], 1, 1) # syncronize time stamps
        sync.registerCallback(fusion)
        print("Lidar Camera Fusion (with eval) Begin.")
        start_time = time.time()
        rospy.spin()
    else:
        sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera], 1, 1)
        sync.registerCallback(fusion)
        print("Lidar Camera Fusion Begin.")
        start_time = time.time()
        rospy.spin()
