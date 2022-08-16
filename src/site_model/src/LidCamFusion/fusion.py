#!/usr/bin/env python3

#############################################################
#   This py file get the lidar and camera info (time syncr  #
#   onize) and make fusion.                                 #
#############################################################


from pathlib import Path
import argparse
import yaml
import rospy
from termcolor import colored
import message_filters
import ros_numpy
import os

from visualization_msgs.msg import MarkerArray
from PIL import Image
import cv2
from sensor_msgs.msg import PointCloud2                 # pointcloud type
from nav_msgs.msg import Odometry                       # odometry type
from msgs.msg._MsgCamera import *                       # Image type: camera msgs class
from msgs.msg._MsgLidCam import *                       # fusion message type
from msgs.msg._MsgLidCamObject import *
from .OpenPCDet.tools.pred import *                     # 3d Detection tool
from ..utils.yolo.yolo import YOLO                      # vision detection
from ..utils.poi_and_roi import pointcloud_roi          # pointcloud detection
from ..utils.poi_and_roi import image_roi               # image detection
from ..utils.visualization import lidar_camera_match2visual, display_rviz
from ..utils.evaluation import eval3d
from ..utils.common_utils import get_gt_boxes3d, label2camera, transform
from ..utils.transform import lidar2pixel, box_to_corner_3d, get_dpm, p2w, world2pixel


def fusion(pointcloud=None, msgcamera=None, odom=None, counter=None):
    """
        pointcloud: [N,4]
        msgcamera: [1,8] -> eight Images
        In eval process, real time dataset collection and store done first. When preset limitation of
        samples reach, evaluation begins.
    """
    global start_time

    if params.eval:
        pub_lidcam = rospy.Publisher("/lidar_camera_fused", MsgLidCam, queue_size=1)
        points = np.loadtxt(os.path.join(str(ROOT_DIR / 'dataset' / 'test_dataset' / 'pcd'), '{}.txt'.format(counter)))
        images = [Image.fromarray(cv2.imread(os.path.join(str(ROOT_DIR / 'dataset' / 'test_dataset' / 'img'), '{}'.format(counter), '{}.jpg'.format(num)))) for num in range(8)]
        odom = odoms[counter]
    else:
        assert isinstance(pointcloud, PointCloud2)
        assert isinstance(msgcamera, MsgCamera)
        points = convert_ros_pointcloud_to_numpy(pointcloud)
        images = [img for img in msgcamera.camera]
        
    # pointcloud roi
    pred_boxes3d, pred_labels, pred_scores = pointcloud_detector.get_pred_dicts(points, False)
    print(np.sqrt((pred_boxes3d[0][0]-odom[0])**2 + (pred_boxes3d[0][1]-odom[1])**2))
    cameras, pred_corners3d, pixel_poses = pointcloud_roi(calib, pred_boxes3d)
    # image roi
    pred_boxes2d = [image_roi(img, yolo) for img in images]
    gt_boxes3d = gt_cameras = gt_corners3d = gt_pixel_poses = None
    if params.gt:
        assert isinstance(odom, Odometry) , f'odom message should be {Odometry} but got {type(odom)}'
        gt_boxes3d = get_gt_boxes3d(odom)
        gt_cameras, gt_corners3d, gt_pixel_poses = pointcloud_roi(calib, gt_boxes3d)
        
    # matching
    iou_thresh = config['lid_cam_fusion']['iou_thresh']
    match, image, lidar, vehicles = get_match(cameras, pixel_poses, pred_boxes2d, iou_thresh)
    # merging
    updated_boxes3d, updated_corners3d, updated_pixel_poses = get_fusion(match, pred_boxes2d, pred_boxes3d, pred_corners3d, pixel_poses, gt_boxes3d)

    # generate fusion message and publish result
    if not params.eval:
        msglidcam = get_msgldcam(match, updated_boxes3d, image, lidar)
        pub_lidcam.publish(msglidcam)
        fps = get_fps(start_time)

    # TODO: support multi evals
    # eval
    if params.eval:
        eval.eval(odom, pred_boxes3d, updated_boxes3d)
    
    if params.disp:                                                                         # display 3d boxes to rviz
        marker_array = display_rviz(pred_corners3d, vehicles, gt_corners3d)
        pub_marker = rospy.Publisher('/display_rviz', MarkerArray, queue_size=1)
        pub_marker.publish(marker_array)
    if params.printl:                                                                       # print pred results to screen
        print2screen_lidar(pred_boxes3d, pred_labels, pred_scores)
    if params.printm:                                                                       # print match results to screen
        print2screen_match(match, image, lidar)
    if params.savem:                                                                        # save match results
        output_dir = str(ROOT_DIR / config['output']['LidCamFusion_dir'])
        lidar_camera_match2visual(match, image, lidar, pred_boxes2d, pixel_poses, msgcamera, output_dir, gt_cameras, gt_pixel_poses)


def get_fps():
    # fps evalution (without results evalution and visualization)
    cur_time = time.time()
    time_span = cur_time - start_time
    start_time = cur_time
    fps = 1 / time_span
    return fps


def get_match(cameras, pixel_poses, boxes2d, iou_thresh):
    """
        cameras: (N,M)
        pixel_poses: (N,1) -> N: num of vehicles
        cameras, pixel_poses => pred_boxes3d
        boxes2d: (8,N,6) -> 8 cameras, num of vehicles, [left top right bottom score calss]
        For each vehicle detected by lidar, match the only one camera

        cameras, pixel_poses, boxes2d may be empty: []
    """
    
    match = []          # match
    vehicles = []       # wehicles that are matched
    labels_set = []     # box2d matched or not
    image = []          # image
    lidar = []          # lidar

    # add labels for boxes2d: 0->mismatched, 1->matched
    for camera in range(len(boxes2d)):
        labels = [0] * len(boxes2d[camera])                         # if len=0 then labels is []
        labels_set.append(labels)

    # match lidar and camera
    # if 1st camera not matched, try other cameras
    # note the sequence of cameras in `cameras`
    for vehicle, pixel_pose in enumerate(pixel_poses):              # for each vehicle detected by lidar
        # get camera
        for i, camera in enumerate(cameras[vehicle]):               # consider the first camera, other camera(s) will be considered if 1st not matched
            # get all boxes2d of this camera
            box2d = boxes2d[camera-1]
            # get labels of all boxes2d
            labels = labels_set[camera-1]
            bbox = get_bbox_from_box3d(pixel_pose[i])           
            if len(box2d) != 0:
                iou2ds = get_iou2d(bbox, box2d, labels, iou_thresh)     # ious of 1-lidar detected and N-camera detected
                if len(np.where(iou2ds != -1)[0]) != 0:                 # matched box exist
                    idx = np.where(iou2ds==np.max(iou2ds))              # idx: index of maximum iou2d: 2-d
                    labels_set[camera-1][idx[0][0]] = 1                 # label matched box2d and remove box2d if this vehicle already matched
                    if vehicle not in vehicles:                         # current vehicle not matched
                        vehicles.append(vehicle)                        # label matched vehicle
                        cur_match = [camera, vehicle, i, idx[0][0]]     # [camera num, vehcile num(lidar), camera num(vehicle), box2d num(camera)]
                        match.append(cur_match)
    
    # image only: add remaining detecteion results (midmatched) to the list according to labels_set
    for camera in range(len(boxes2d)):
        cur_image = [camera+1]
        for box2d, label in zip(boxes2d[camera], labels_set[camera]):
            if not label:
                cur_image.append(box2d)
        image.append(cur_image)
    # lidar only: add remaining detection results (mismatched) to the list according to vehicels
    for vehicle in range(len(pixel_poses)):
        if vehicle not in vehicles:
            lidar.append([cameras[vehicle], vehicle])

    return match, image, lidar, vehicles

def get_bbox_from_box3d(pixel_pose):
    W = config['camera']['width']
    H = config['camera']['height']

    xaxis = np.array(pixel_pose)[:,0]
    yaxis = np.array(pixel_pose)[:,1]
    x_max = np.max(xaxis) if np.max(xaxis) <= W else W
    x_min = np.min(xaxis) if np.min(xaxis) >= 0 else 0
    y_max = np.max(yaxis) if np.max(yaxis) <= H else H
    y_min = np.min(yaxis) if np.min(yaxis) >= 0 else 0

    return np.array([x_min, y_min, x_max, y_max])
    

def get_iou2d(boxa, boxesb, labels, iou_thresh):
    """
        boxa: (1,) -> lidar
        boxesb: (N,) -> camera
    """
    W = config['camera']['width']
    H = config['camera']['height']

    def get_single_iou2d(boxa, boxb):                       # for each vehicle detected by camera
        x1 = max(boxa[0], boxb[0], 0)                       # note the boundary of image: (640,480)
        y1 = max(boxa[1], boxb[1], 0)
        x2 = min(boxa[2], boxb[2], W)
        y2 = min(boxa[3], boxb[3], H)
        areaa = (boxa[2] - boxa[0]) * (boxa[3] - boxa[1])
        areab = (boxb[2] - boxb[0]) * (boxb[3] - boxb[1])
        overlap = (x2 - x1) * (y2 - y1)
        iou2d = overlap / (areaa + areab - overlap)
        return iou2d

    iou2ds = []
    for boxb, label in zip(boxesb, labels):
        if not label:                                       # current boxb has not been matched yet
            iou2d = get_single_iou2d(boxa, boxb)
            if iou2d < iou_thresh:                          # if iou is too small, mismatch
                iou2d = -1
        else:                                               # if boxb is matched before, mismatch
            iou2d = -1
        iou2ds.append(iou2d)

    return np.array(iou2ds)


def get_fusion(match, boxes2d, boxes3d, corners3d, pixels_poses, gt_boxes3d=None):
    """
        match: [camera num, vehcile num(lidar), camera num(vehicle), box2d num(camera)]
        box2d: [left, top, right, down]
    """
    xcameras = np.array([-2, 4, 6, -8])
    ycameras = np.array([1, -3, -5, 7])
    
    for obj in match:
        camera_num, vehicle_num, camera_num_vehicle, box2d_num = obj[0], obj[1], obj[2], obj[3]
        box2d = boxes2d[camera_num-1][box2d_num]
        box3d, corner3d, pixel_pose = boxes3d[vehicle_num], corners3d[vehicle_num], pixels_poses[vehicle_num][camera_num_vehicle]

        # truncated detect
        if is_truncated(box2d, pixel_pose):
            continue

        CAMERA = config['lid_cam_fusion']['camera_weight']
        LIDAR = config['lid_cam_fusion']['lidar_weight']
        assert (CAMERA+LIDAR==1), 'The sum of weights should equal to 1.'
        # fix vector of lidar
        lidar_increment = np.array([0] * 7).astype(np.float64)

        # horzontal fix
        lidar_center = np.array([np.mean([pixel_pose[0][0], pixel_pose[1][0], pixel_pose[2][0], pixel_pose[3][0]]),
                                 np.mean([pixel_pose[0][1], pixel_pose[3][1], pixel_pose[4][1], pixel_pose[7][1]])])
        camera_center = np.array([np.mean([box2d[0], box2d[2]]), np.mean([box2d[1], box2d[3]])])
        if gt_boxes3d is not None:
            camera_name = label2camera[camera_num]
            world_pose = np.append(gt_boxes3d[0][0:3], 1)
            gt_center = world2pixel(calib, camera_name, world_pose)
            print("lidar_center: ", lidar_center)
            print("camer_center: ", camera_center)
            print("gt_center: ", gt_center, '\n')
        horizontal_diff = (lidar_center[0] - camera_center[0]) * CAMERA
        if camera_num in abs(xcameras):
            dpm = get_dpm(calib, camera_num, box3d[0:2], 0)
            lidar_increment[1] += np.sign(xcameras[np.where(abs(xcameras)==camera_num)[0][0]]) * dpm * horizontal_diff
        elif camera_num in abs(ycameras):
            dpm = get_dpm(calib, camera_num, box3d[0:2], 1)
            lidar_increment[0] += np.sign(ycameras[np.where(abs(ycameras)==camera_num)[0][0]]) * dpm * horizontal_diff
        box3d += lidar_increment
        corner3d[:,0:2] += lidar_increment[0:2]
        
        # rotation fix
        pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
        bbox = get_bbox_from_box3d(pixel_pose)
        lidar_ratio = bbox[0] / bbox[1]
        camera_ratio = box2d[0] / box2d[1]

        INCREMENT_RY = 0.01
        box3d[6] += INCREMENT_RY
        corner3d = box_to_corner_3d(np.array([box3d]))[0]
        box3d[6] -= INCREMENT_RY
        pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
        bbox = get_bbox_from_box3d(pixel_pose)
        lidar_ratio_new = bbox[0] / bbox[1]
        anticlockwise = None
        if abs(lidar_ratio_new-camera_ratio) < abs(lidar_ratio-camera_ratio):
            anticlockwise = 1
        else:
            box3d[6] -= INCREMENT_RY
            corner3d = box_to_corner_3d(np.array([box3d]))[0]
            box3d[6] -= INCREMENT_RY
            pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
            bbox = get_bbox_from_box3d(pixel_pose)
            lidar_ratio_new = bbox[0] / bbox[1]
            if abs(lidar_ratio_new-camera_ratio) < abs(lidar_ratio-camera_ratio):
                anticlockwise = -1

        if anticlockwise is not None:
            is_decrease = 1
            last_diff =  1e3
            while(abs(lidar_ratio_new-camera_ratio) > abs(lidar_ratio-camera_ratio) * LIDAR and is_decrease):
                lidar_increment[6] += anticlockwise * INCREMENT_RY
                box3d[6] += anticlockwise * INCREMENT_RY
                corner3d = box_to_corner_3d(np.array([box3d]))[0]
                pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
                bbox = get_bbox_from_box3d(pixel_pose)
                lidar_ratio_new = bbox[0] / bbox[1]
                if not abs(lidar_ratio_new-camera_ratio) < last_diff:
                    is_decrease = 0
                last_diff = abs(lidar_ratio_new-camera_ratio)
    
    return boxes3d, corners3d, pixels_poses


def get_msgldcam(match, updated_boxes3d, image, lidar) -> MsgLidCam:
    msglidcam = MsgLidCam()
    msglidcam.header.stamp = rospy.Time.now()

    # add matched vehicles
    for obj in match:
        vehicle_num = obj[1]
        box3d = updated_boxes3d[vehicle_num]
        
        msglidcamobject = MsgLidCamObject()
        msglidcamobject.pos_x = box3d[0]
        msglidcamobject.pos_y = box3d[1]
        msglidcamobject.alpha = box3d[6]
        if msglidcamobject.pos_y >= 0:
            msglidcam.objects_intersection.append(msglidcamobject)
            msglidcam.num_intersection += 1
        else:
            msglidcam.objects_circle.append(msglidcamobject)
            msglidcam.num_circle += 1

    # add lidar-based vehicles
    for obj in lidar:
        vehicle_num = obj[1]
        box3d = updated_boxes3d[vehicle_num]

        msglidcamobject = MsgLidCamObject()
        msglidcamobject.pos_x = box3d[0]
        msglidcamobject.pos_y = box3d[1]
        msglidcamobject.alpha = box3d[6]
        if msglidcamobject.pos_y >= 0:
            msglidcam.objects_intersection.append(msglidcamobject)
            msglidcam.num_intersection += 1
        else:
            msglidcam.objects_circle.append(msglidcamobject)
            msglidcam.num_circle += 1
    
    # add camera-based vehicles
    # TODO: measurement
    for obj in image:
        if len(obj) != 1 and not is_truncated(obj[1]):
            box3d = get_boxes3d_from_boxes2d(calib, np.array(obj))
            
            msglidcamobject = MsgLidCamObject()
            msglidcamobject.pos_x = box3d[0]
            msglidcamobject.pos_y = box3d[1]
            msglidcamobject.alpha = -1
            if msglidcamobject.pos_y >= 0:
                msglidcam.objects_intersection.append(msglidcamobject)
                msglidcam.num_intersection += 1
            else:
                msglidcam.objects_circle.append(msglidcamobject)
                msglidcam.num_circle += 1
    
    return msglidcam


def get_boxes3d_from_boxes2d(calib, obj):               # obj: [camera_num, box2d]
    MEASUREMENT_DIR = ROOT_DIR.joinpath(config['measurement']['measurement_dir'], 'measurement.txt')
    measurement = np.loadtxt(MEASUREMENT_DIR)
    w2c = measurement[transform[label2camera[obj[0]]]][0:16].reshape(4,4)
    c2p = measurement[transform[label2camera[obj[0]]]][16:28].reshape(3,4)

    box2d = obj[1][0:4]
    pos_pxl = np.array([np.mean([box2d[0], box2d[2]]), np.mean([box2d[1], box2d[3]]), 1])
    pos_wld, zc = p2w(pos_pxl, 0.1, w2c, c2p)

    return pos_wld
    

def is_truncated(box2d=None, pixel_pose=None):
    W = config['camera']['width']
    H = config['camera']['height']

    if box2d is not None:
        if box2d[0] <= 0 or box2d[1] <= 0 or box2d[2] >= W or box2d[3] >= H:
            return True
    if pixel_pose is not None:
        xaxis = np.array(pixel_pose)[:,0]
        yaxis = np.array(pixel_pose)[:,1]
        if np.min(xaxis) <= 0 or np.min(yaxis) <= 0 or np.max(xaxis) >= W or np.max(yaxis) >= H:
            return True

    return False


def convert_ros_pointcloud_to_numpy(pointcloud: PointCloud2):
    pc = ros_numpy.numpify(pointcloud)
    points = np.zeros((pc.shape[0],4))
    points[:,0] = pc['x']
    points[:,1] = pc['y']
    points[:,2] = pc['z']

    return points


def print2screen_lidar(pred_boxes3d, pred_labels, pred_scores):
    label2class = {1: 'Car', 2: 'Pedstrain', 3: 'Bicycle' }
    print("+-------------------------------------------------------------------------------------------+")
    print("num_car: ", len(pred_boxes3d))
    for i in range(len(pred_boxes3d)):
        print(i+1, " ==> ", label2class[int(pred_labels[i])], "  score: ", pred_scores[i])
        print("  ", pred_boxes3d[i][0:3], " ", pred_boxes3d[i][3:6], " ", pred_boxes3d[i][6])
    print("+-------------------------------------------------------------------------------------------+\n")


def print2screen_match(match, image, lidar):
    """
        match: [camera num, vehcile num(lidar), box2d num(camera)]
        image: [[1,],[2,],...,[8,]]
        lidar: [[camera num, vehicle num]]
    """
    print("+-------------------------------------------------------------------------------------------+")
    print("match: ", match)
    print("image: ", image)
    print("lidar: ", lidar)
    print("+-------------------------------------------------------------------------------------------+\n")


def eval_fusion():
    limit = 2000
    counter = 0
    while(counter != limit):
        fusion(counter=counter)
        counter += 1
    import sys
    sys.exit(0)


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= str(ROOT_DIR / 'config/config.yaml'))
    parser.add_argument("--eval", help="eval mode if specify", action='store_true', required=False)
    parser.add_argument("--gt", help="wehter to caculate gt_goxes", action='store_true', required=False)
    parser.add_argument("--re", help="run with eval online", action='store_true', required=False)
    parser.add_argument("--disp", help="whether display to rviz", action='store_true', required=False)
    parser.add_argument("--savem", help="wehter to save match result", action='store_true', required=False)
    parser.add_argument("--printl", help="wehter to print lidar results to screen", action='store_true', required=False)
    parser.add_argument("--printm", help="wehter to print match results to screen", action='store_true', required=False)
    params = parser.parse_args()
    with open(params.config, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print(colored('Config file could not be read.','red'))
            exit(1)

    pointcloud_detector = RT_Pred(ROOT_DIR, config)                             # Create pointcloud detector
    yolo = YOLO(ROOT_DIR)                                                       # Create YOLO detector
    calib_dir = str(ROOT_DIR.joinpath(config['calib']['calib_dir']))            # get calaibration file
    calib = np.loadtxt(os.path.join(calib_dir, 'calib.txt'))

    if params.eval:
        import os
        import datetime
        log_dir = str(ROOT_DIR)+'/src/LidCamFusion/eval/%s/' % datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
        os.makedirs(log_dir, exist_ok=True)
        eval = eval3d(log_dir)                                                  # Create evaluator
        odoms = np.loadtxt(os.path.join(str(ROOT_DIR / 'dataset' / 'test_dataset' / 'odom'), '2000.txt'))
        eval_fusion()
    else:
        rospy.init_node('lidar_camera_fusion', anonymous=True)

        fps = 0
        sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
        sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)
        
        if params.gt or params.re:
            # TODO: define the number of vehicles
            sub_odom = message_filters.Subscriber('/deepracer1/base_pose_ground_truth', Odometry)
            sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera, sub_odom], 1, 1) # syncronize time stamps
            sync.registerCallback(fusion)
            print("Lidar Camera Fusion (with gt_boxes) Begin.")
            start_time = time.time()
            rospy.spin()
        else:
            sync = message_filters.ApproximateTimeSynchronizer([sub_pointcloud, sub_camera], 1, 1)
            sync.registerCallback(fusion)
            print("Lidar Camera Fusion Begin.")
            start_time = time.time()
            rospy.spin()
