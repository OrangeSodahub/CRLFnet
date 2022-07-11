from pathlib import Path
from datetime import datetime
import numpy as np

from sensor_msgs.msg import Image
from msgs.msg._MsgCamera import MsgCamera

from cv_bridge import CvBridge
import cv2


def radar2visual(output_dir: Path, raw_image: Image, radar_pois=(), radar_rois=(), image_rois=(), draw_radar=True, draw_image=True, appendix="Unknown"):
    # make output dir
    output_dir.mkdir(exist_ok=True)

    # convert image format to opencv
    result_image = CvBridge().imgmsg_to_cv2(raw_image, 'bgr8')
    # draw radar POIs
    if draw_radar:
        for rpoi in radar_pois:
            cv2.circle(result_image, (rpoi[0], rpoi[1]), 5, (0, 0, 255), -1)
    # draw image ROIs
    if draw_image:
        for iroi in image_rois:
            cv2.rectangle(result_image, (iroi[0], iroi[1]), (iroi[2], iroi[3]), (255, 0, 0), 3)
    # draw radar expanded ROIs
    if draw_radar:
        for rroi in radar_rois:
            cv2.rectangle(result_image, (rroi[0], rroi[1]), (rroi[2], rroi[3]), (0, 255, 0), 3)

    # save visualized result
    file_name = "RCF_{}_{}.jpg".format(appendix, datetime.now().strftime("%Y%m%d_%H%M%S_%f"))
    output_path = output_dir.joinpath(file_name)
    cv2.imwrite(str(output_path), result_image)
    print("\033[0;32mSaved the visualized result \033[1;32m\"{}\"\033[0;32m sucessfully.\033[0m".format(file_name))


def lidar2visual(img, box3d, color):
    if isinstance(img, Image):
        img = CvBridge().imgmsg_to_cv2(img, 'bgr8')
    # get 8 pts
    pts1 = (round(box3d[0][0]), round(box3d[0][1]))
    pts2 = (round(box3d[1][0]), round(box3d[1][1]))
    pts3 = (round(box3d[2][0]), round(box3d[2][1]))
    pts4 = (round(box3d[3][0]), round(box3d[3][1]))
    pts5 = (round(box3d[4][0]), round(box3d[4][1]))
    pts6 = (round(box3d[5][0]), round(box3d[5][1]))
    pts7 = (round(box3d[6][0]), round(box3d[6][1]))
    pts8 = (round(box3d[7][0]), round(box3d[7][1]))

    # draw 12 lines
    cv2.line(img, pts1, pts2, color, 1)
    cv2.line(img, pts2, pts3, color, 1)
    cv2.line(img, pts3, pts4, color, 1)
    cv2.line(img, pts4, pts1, color, 1)

    cv2.line(img, pts5, pts6, color, 1)
    cv2.line(img, pts6, pts7, color, 1)
    cv2.line(img, pts7, pts8, color, 1)
    cv2.line(img, pts8, pts5, color, 1)

    cv2.line(img, pts1, pts5, color, 1)
    cv2.line(img, pts2, pts6, color, 1)
    cv2.line(img, pts3, pts7, color, 1)
    cv2.line(img, pts4, pts8, color, 1)

    return img


def camera2visual(img, box2d, color):
    if isinstance(img, Image):
        img = CvBridge().imgmsg_to_cv2(img, 'bgr8')
    pt1 = (round(box2d[0]), round(box2d[1]))
    pt2 = (round(box2d[2]), round(box2d[3]))
    cv2.rectangle(img, pt1, pt2, color, 1)
    return img


def lidar_camera_match2visual(match, image, lidar, boxes2d, boxes3d, msgcamera: MsgCamera, output_dir: str, gt_cameras, gt_boxes3d):
    """
        cameras: [[camera1, camera2, ...],[camera1, camera2, ...], ...]
            vehicle: [camera1, camera2, ...]
            camera: int
        pixel_poses: [[vehicle1], [vehicle2], ...]
            vehicle: [camera1, camera2, ...]
            camera:  [[x y 1], [x y 1], [], ...]
                     -> each [x y 1] reprensents 2-d coordinates of a point and there are 8 points
        match: [camera num, vehcile num(lidar), box2d num(camera)]
    """
    # match
    for vehicle in match:
        camera_num, vehicle_num, camera_num_vehicle, box2d_num = vehicle[0], vehicle[1], vehicle[2], vehicle[3]
        box2d = boxes2d[camera_num-1][box2d_num]
        box3d = boxes3d[vehicle_num][camera_num_vehicle]
        # lidar
        msgcamera.camera[camera_num-1] = lidar2visual(msgcamera.camera[camera_num-1], box3d, (0,255,0))
        # camera
        msgcamera.camera[camera_num-1] = camera2visual(msgcamera.camera[camera_num-1], box2d, (0,255,0))

    # lidar only
    for vehicle in lidar:
        camera = vehicle[0]
        vehicle_num = vehicle[1]
        for i, camera_num in enumerate(camera):
            box3d = boxes3d[vehicle_num][i]
            msgcamera.camera[camera_num-1] = lidar2visual(msgcamera.camera[camera_num-1], box3d, (255,0,0))

    # image only
    for camera in image:
        if len(camera) != 1:
            camera_num = camera[0]
            box2d = camera[1]
            msgcamera.camera[camera_num-1] = camera2visual(msgcamera.camera[camera_num-1], box2d, (0,0,255))

    # gt_box (for one car)
    if gt_cameras is not None and gt_boxes3d is not None:
        for cameras_vehicle, gt_boxes3d_vehicle in zip(gt_cameras, gt_boxes3d):
            for camera_num, gt_box3d in zip(cameras_vehicle, gt_boxes3d_vehicle):
                msgcamera.camera[camera_num-1] = lidar2visual(msgcamera.camera[camera_num-1], gt_box3d, (0,255,255))
        
    # save images
    num2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }
    for num, img in enumerate(msgcamera.camera):
        if not isinstance(img, Image):
            camera_name = num2camera[num+1]
            img_file = output_dir + ('/image_%s_' % datetime.now().strftime('%Y%m%d-%H%M%S') + camera_name + '.jpg')
            # print(img_file, "saved.")
            cv2.imwrite(img_file, img)