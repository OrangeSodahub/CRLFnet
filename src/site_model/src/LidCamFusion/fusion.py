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

from sensor_msgs.msg import Image               # image  type
from sensor_msgs.msg import PointCloud2         # pointcloud type
from msgs.msg._MsgCamera import *               # Image type: camera msgs class
from nav_msgs.msg import Odometry               # odometry type
from .OpenPCDet.tools.pred import *             # 3d Detection tool
from .pointcloud_roi import pointcloud_roi      # pointcloud detection
from ..utils.yolo.yolo import YOLO              # vision detection
from ..utils.image_roi import image_roi

from msgs.msg._MsgLidCam import *               # fusion message type
from msgs.msg._MsgLidCamObject import *
from ..utils.visualization import lidar_camera_match2visual

from ..utils.evaluation import eval3d, get_gt_box
from ..utils.common_utils import get_dpm
from ..utils.transform import lidar2pixel


def fusion(pointcloud, msgcamera, odom=None):
    """
        pointcloud: [N,4]
        msgcamera: [1,8] -> eight Images
    """
    assert isinstance(pointcloud, PointCloud2)
    assert isinstance(msgcamera, MsgCamera)
    global counter, start_time, pred_counter

    # pointcloud roi
    gt_cameras = gt_pixel_poses = None
    points = convert_ros_pointcloud_to_numpy(pointcloud)
    pred_boxes3d, pred_labels, pred_scores = pointcloud_detector.get_pred_dicts(points, False)
    cameras, corners3d, pixel_poses = pointcloud_roi(ROOT_DIR, config, pred_boxes3d)           # get cameras and pixel_poses of all vehicles
    if params.print2screen_lidar:                                                   # print pred results to screen
        print2screen_lidar(pred_boxes3d, pred_labels, pred_scores)
    if odom is not None and params.gt_boxes:
        gt_box3d = get_gt_box(odom)
        gt_cameras, gt_corners3d, gt_pixel_poses = pointcloud_roi(ROOT_DIR, config, gt_box3d)

    # image roi
    pred_boxes2d = []
    for img in msgcamera.camera:
        pred_box2d = image_roi(img, yolo)
        pred_boxes2d.append(pred_box2d)

    # pred results eval: BEV (for one car)
    # if odom is not None and params.eval:
    #     # 3d-detection only: use 'pred_boxes3d' to eval
    #     global alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn
    #     if counter >= 50:
    #         pred_counter, alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn = eval3d(odom, pred_boxes3d, logger, pred_counter,
    #                                                                                 alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn)
    #     if counter % 1000 == 0:
    #         np.savetxt(str(ROOT_DIR / ('src/LidCamFusion/eval/3d_detection_only_%s.txt' % counter)), tp_fp_fn)
        
    # object match
    iou_thresh = config['lid_cam_fusion']['iou_thresh']
    match, image, lidar = get_match(cameras, pixel_poses, pred_boxes2d, iou_thresh)
    if params.print2screen_match:
        print2screen_match(match, image, lidar)
    if params.save_match_result:                                                    # visualize match result
        output_dir = str(ROOT_DIR / config['output']['LidCamFusion_dir'])
        lidar_camera_match2visual(match, image, lidar, pred_boxes2d, pixel_poses, msgcamera, output_dir, gt_cameras, gt_pixel_poses)

    # object fusion
    if odom is not None and len(pred_boxes3d) != 0:
        diff_x_1 = odom.pose.pose.position.x - pred_boxes3d[0][0]
        diff_y_1 = odom.pose.pose.position.y - pred_boxes3d[0][1]
    msglidcam, fix_pred_boxes3d, fix_pixel_poses = get_fusion(match, pred_boxes2d, pred_boxes3d, corners3d, pixel_poses)
    if odom is not None and params.eval:
        global alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn
        if counter >= 50:
            pred_counter, alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn = eval3d(odom, fix_pred_boxes3d, logger, pred_counter,
                                                                                    alpha_diff, pose_diff, iou3d, iou_bev, tp_fp_fn)
    if odom is not None and len(pred_boxes3d) != 0:
        diff_x_2 = odom.pose.pose.position.x - pred_boxes3d[0][0]
        diff_y_2 = odom.pose.pose.position.y - pred_boxes3d[0][1]
        if diff_x_1 != diff_x_2 or diff_y_1 != diff_y_2:
            print(diff_x_1, diff_y_1)
            print(diff_x_2, diff_y_2, '\n')
    # publish result
    msglidcam.header.stamp = rospy.Time.now()
    pub = rospy.Publisher("/lidar_camera_fused", MsgLidCam)
    pub.publish(msglidcam)

    # fps evalution (without results evalution and visualization)
    cur_time = time.time()
    time_span = cur_time - start_time
    start_time = cur_time
    counter += 1
    # fps = (counter-1) / time_span
    fps = 1 / time_span
    # print('FPS: ', fps, 'cnt: ', counter)
    

def get_match(cameras, pixel_poses, boxes2d, iou_thresh):
    """
        cameras: (N,M)
        pixel_poses: (N,1) -> N: num of vehicles
        cameras, pixel_poses => pred_boxes3d
        boxes2d: (8,N,6) -> 8 cameras, num of vehicles, [left top right bottom score calss]
        For each vehicle detected by lidar, match the only one camera

        cameras, pixel_poses, boxes2d may be empty: []
    """
    # match
    match = []
    vehicles = []
    idxes = []
    # image
    image = []
    # lidar
    lidar = []

    # add labels for boxes2d: 0->mismatched, 1->matched
    for camera in range(len(boxes2d)):
        labels = [0] * len(boxes2d[camera]) # if len=0 then labels is []
        idxes.append(labels)

    # match lidar and camera
    # if 1st camera not matched, try other cameras
    # note the sequence of cameras in `cameras`
    for vehicle, pixel_pose in enumerate(pixel_poses):              # for each vehicle detected by lidar
        # get camera
        for i, camera in enumerate(cameras[vehicle]):               # consider the first camera, other camera(s) will be considered if 1st not matched
            # get all boxes2d of this camera
            box2d = boxes2d[camera-1]
            # get labels of all boxes2d
            labels = idxes[camera-1]
            bbox = get_bbox_from_box3d(pixel_pose[i])           
            if len(box2d) != 0:
                iou2ds = get_iou2d(bbox, box2d, labels, iou_thresh)     # ious of 1-lidar detected and N-camera detected
                if len(np.where(iou2ds != -1)[0]) != 0:                 # matched box exist
                    idx = np.where(iou2ds==np.max(iou2ds))              # idx: index of maximum iou2d: 2-d
                    idxes[camera-1][idx[0][0]] = 1                      # label matched box2d and remove box2d if this vehicle already matched
                    if vehicle not in vehicles:                         # current vehicle not matched
                        vehicles.append(vehicle)                        # label matched vehicle
                        cur_match = [camera, vehicle, i, idx[0][0]]     # [camera num, vehcile num(lidar), camera num(vehicle), box2d num(camera)]
                        match.append(cur_match)
    
    # image only: add remaining detecteion results (midmatched) to the list according to idxes
    for camera in range(len(boxes2d)):
        cur_image = [camera+1]
        for box2d, label in zip(boxes2d[camera], idxes[camera]):
            if not label:
                cur_image.append(box2d)
        image.append(cur_image)
    # lidar only: add remaining detection results (mismatched) to the list according to vehicels
    for vehicle in range(len(pixel_poses)):
        if vehicle not in vehicles:
            lidar.append([cameras[vehicle], vehicle])

    return match, image, lidar

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
        if not label:
            iou2d = get_single_iou2d(boxa, boxb)
            if iou2d < iou_thresh:                          # if iou is too small, mismatch
                iou2d = -1
        else:                                               # if box2d is matched before, mismatch
            iou2d = -1
        iou2ds.append(iou2d)

    return np.array(iou2ds)


def get_fusion(match, boxes2d, boxes3d, corners3d, pixels_poses):
    """
        match: [camera num, vehcile num(lidar), camera num(vehicle), box2d num(camera)]
        box2d: [left, top, right, down]
    """
    msglidcam = MsgLidCam()
    x_axis_camera = np.array([1, 3, 5, 7])
    y_axis_camera = np.array([2, 4, 6, 8])
    axis_orientation = np.array([1, -1, -1, 1])

    calib_dir = str(ROOT_DIR.joinpath(config['calib']['calib_dir']))
    calib = np.loadtxt(os.path.join(calib_dir, 'calib.txt'))
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }
    
    for obj in match:
        camera_num, vehicle_num, camera_num_vehicle, box2d_num = obj[0], obj[1], obj[2], obj[3]
        box2d = boxes2d[camera_num-1][box2d_num]
        box3d, pixel_pose = boxes3d[vehicle_num], pixels_poses[vehicle_num][camera_num_vehicle]
        corner3d = corners3d[vehicle_num]

        # truncated detect
        if is_truncated(box2d, pixel_pose):
            continue
        
        # position fix
        CAMERA_WEIGHT = config['lid_cam_fusion']['camera_weight']
        LIDAR_WEIGHT = config['lid_cam_fusion']['lidar_weight']
        assert (CAMERA_WEIGHT+LIDAR_WEIGHT==1), 'The sum of weights should be 1.'
        camera_increment = []                                                           # fix vector of camera
        lidar_increment = np.array([0] * 7).astype(np.float64)                          # fix vector of lidar

        # vertical axis
        VERTICAL_INCREMENT = 0.00005
        bbox = get_bbox_from_box3d(pixel_pose)
        if ((bbox[2]-bbox[0]) - (box2d[2]-box2d[0])) * ((bbox[3]-bbox[1]) - (box2d[3]-box2d[1])) > 0:               # horizontal and vertical greater or smaller simultaneously
            if (bbox[2]-bbox[0]) - (box2d[2]-box2d[0]) > 0:
                sign = 1
            else:
                sign = -1
            diff_h = abs((bbox[2]-bbox[0]) - (box2d[2]-box2d[0]))
            diff_w = abs((bbox[3]-bbox[1]) - (box2d[3]-box2d[0]))
            while sign*((bbox[2]-bbox[0]) - ((box2d[2]-box2d[0])+sign*diff_h*CAMERA_WEIGHT)) > 0 and sign*((bbox[3]-bbox[1]) - ((box2d[3]-box2d[1])+sign*diff_w*CAMERA_WEIGHT)) > 0:
                if camera_num in x_axis_camera:
                    corner3d[:,1] += VERTICAL_INCREMENT * sign * axis_orientation[np.where(x_axis_camera==camera_num)][0]
                    lidar_increment[1] += VERTICAL_INCREMENT * sign * axis_orientation[np.where(x_axis_camera==camera_num)][0]
                elif camera_num in y_axis_camera:
                    corner3d[:,0] += VERTICAL_INCREMENT * (-sign) * axis_orientation[np.where(y_axis_camera==camera_num)][0]
                    lidar_increment[0] += VERTICAL_INCREMENT * (-sign) * axis_orientation[np.where(y_axis_camera==camera_num)][0]
                pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
                bbox = get_bbox_from_box3d(pixel_pose)
                 
        # horizontal axis
        HORIZONTAL_INCREMENT = 0.00005
        lidar_center = np.array([np.mean([pixel_pose[0][0], pixel_pose[1][0], pixel_pose[2][0], pixel_pose[3][0]]),
                                 np.mean([pixel_pose[0][1], pixel_pose[3][1], pixel_pose[4][1], pixel_pose[7][1]])])
        camera_center = np.array([np.mean([box2d[0], box2d[2]]), np.mean([box2d[1], box2d[3]])])
        ou_distance = np.linalg.norm(lidar_center-camera_center)
        if lidar_center[0] > camera_center[0]:
            sign = 1
        else:
            sign = -1
        diff = abs(lidar_center[0]-camera_center[0])
        while(sign*(lidar_center[0]-(camera_center[0]+sign*diff*CAMERA_WEIGHT)) > 0):
            if camera_num in x_axis_camera:
                corner3d[:,0] += HORIZONTAL_INCREMENT * (-sign) * axis_orientation[np.where(x_axis_camera==camera_num)][0]
                lidar_increment[0] += HORIZONTAL_INCREMENT * (-sign) * axis_orientation[np.where(x_axis_camera==camera_num)][0]
            elif camera_num in y_axis_camera:
                corner3d[:,1] += HORIZONTAL_INCREMENT * (-sign) * axis_orientation[np.where(y_axis_camera==camera_num)][0]
                lidar_increment[1] += HORIZONTAL_INCREMENT * (-sign) * axis_orientation[np.where(y_axis_camera==camera_num)][0]
            pixel_pose = lidar2pixel(calib, label2camera[camera_num], corner3d)
            lidar_center = np.array([np.mean([pixel_pose[0][0], pixel_pose[1][0], pixel_pose[2][0], pixel_pose[3][0]]),
                                     np.mean([pixel_pose[0][1], pixel_pose[3][1], pixel_pose[4][1], pixel_pose[7][1]])])

        # update boxes3d
        print(lidar_increment)
        boxes3d[vehicle_num] = box3d + lidar_increment
        pixels_poses[vehicle_num][camera_num_vehicle] = pixel_pose

        # add matched vehicle to msg
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

    return msglidcam, boxes3d, pixels_poses


def is_truncated(box2d, pixel_pose):
    W = config['camera']['width']
    H = config['camera']['height']
    xaxis = np.array(pixel_pose)[:,0]
    yaxis = np.array(pixel_pose)[:,1]
    if (box2d[0] <= 0 or box2d[1] <= 0 or box2d[2] >= W or box2d[3] >= H) or (
       np.min(xaxis) <= 0 or np.min(yaxis) <= 0 or np.max(xaxis) >= W or np.max(yaxis) >= H):
       return True
    else:
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


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", help="path to config file", metavar="FILE", required=False, default= str(ROOT_DIR / 'config/config.yaml'))
    parser.add_argument("--save_match_result", help="wehter to save match result", action='store_true', required=False)
    parser.add_argument("--print2screen_lidar", help="wehter to print to screen", action='store_true', required=False)
    parser.add_argument("--print2screen_match", help="wehter to print to screen", action='store_true', required=False)
    parser.add_argument("--eval", help="wehter to eval", action='store_true', required=False)
    parser.add_argument("--gt_boxes", help="wehter to caculate gt_goxes", action='store_true', required=False)
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
    fps = 0

    # Create an example of pointcloud detector
    pointcloud_detector = RT_Pred(str(ROOT_DIR), config)
    # Create YOLO detector
    yolo = YOLO(ROOT_DIR)

    sub_pointcloud = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_camera = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)

    if params.eval or params.gt_boxes:
        if params.eval:
            # create tensorboard logger
            from tensorboard_logger import Logger
            import datetime
            import os
            log_dir = str(ROOT_DIR)+'/src/LidCamFusion/eval/%s/' % datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
            os.makedirs(log_dir, exist_ok=True)
            logger = Logger(logdir=log_dir, flush_secs=10)
            # pointcloud pred results evaluation
            pred_counter = 1
            alpha_diff = 0
            pose_diff = 0
            iou3d = 0
            iou_bev = 0
            # caculate tp, fp, fn
            N_SAMPLE_PTS = 41
            tp_fp_fn = np.array([np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS), np.zeros(N_SAMPLE_PTS)])
        
        sub_odom = message_filters.Subscriber('/base_pose_ground_truth', Odometry)
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
