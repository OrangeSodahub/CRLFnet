from pathlib import Path
import os
import numpy as np
from datetime import datetime
import numpy as np

from sensor_msgs.msg import Image
from msgs.msg._MsgCamera import MsgCamera

from cv_bridge import CvBridge
import cv2


def radar2visual(output_dir: Path, raw_image: Image, radar_pois=(), image_rois=(), draw_radar=True, draw_image=True, appendix="Unknown"):
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

    # save visualized result
    file_name = "RCF_{}_{}.jpg".format(appendix, datetime.now().strftime("%Y%m%d_%H%M%S_%f"))
    output_path = output_dir.joinpath(file_name)
    cv2.imwrite(str(output_path), result_image)
    print("\033[0;32mSaved the visualized result \033[1;32m\"{}\"\033[0;32m sucessfully.\033[0m".format(file_name))


def lidar2visual(cameras: np.array, pixel_poses, msgcamera: MsgCamera, output_dir: str):
    """
        cameras: [[camera1, camera2, ...],[camera1, camera2, ...], ...] -> each [camera1, camera2,...] represents a vehicle
        pixel_poses: [[vehicle1], [vehicle2], ...]
            vehicle: [camera1, camera2, ...]
            camera:  [[x1 x2 y1 y2], [x1 x2 y1 y2], [], ...]
                     -> each [x1 x2 y1 y2] reprensents 4 coordinates of a point and  there are 8 points
    """
    os.makedirs(output_dir, exist_ok=True)

    # label2camera
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }

    for camera, pixel_pose in zip(cameras, pixel_poses):
        # process single image
        for camera_label, pixel_pose_cur_camera in zip(camera, pixel_pose):
            img = msgcamera.camera[camera_label-1]
            img = CvBridge().imgmsg_to_cv2(img, 'bgr8')
            # get 8 pts
            pts1 = (round(pixel_pose_cur_camera[0][0]), round(pixel_pose_cur_camera[0][1]))
            pts2 = (round(pixel_pose_cur_camera[1][0]), round(pixel_pose_cur_camera[1][1]))
            pts3 = (round(pixel_pose_cur_camera[2][0]), round(pixel_pose_cur_camera[2][1]))
            pts4 = (round(pixel_pose_cur_camera[3][0]), round(pixel_pose_cur_camera[3][1]))
            pts5 = (round(pixel_pose_cur_camera[4][0]), round(pixel_pose_cur_camera[4][1]))
            pts6 = (round(pixel_pose_cur_camera[5][0]), round(pixel_pose_cur_camera[5][1]))
            pts7 = (round(pixel_pose_cur_camera[6][0]), round(pixel_pose_cur_camera[6][1]))
            pts8 = (round(pixel_pose_cur_camera[7][0]), round(pixel_pose_cur_camera[7][1]))

            # draw 12 lines
            cv2.line(img, pts1, pts2, (0,255,0), 2)
            cv2.line(img, pts2, pts3, (0,255,0), 2)
            cv2.line(img, pts3, pts4, (0,255,0), 2)
            cv2.line(img, pts4, pts1, (0,255,0), 2)

            cv2.line(img, pts5, pts6, (0,255,0), 2)
            cv2.line(img, pts6, pts7, (0,255,0), 2)
            cv2.line(img, pts7, pts8, (0,255,0), 2)
            cv2.line(img, pts8, pts5, (0,255,0), 2)

            cv2.line(img, pts1, pts5, (0,255,0), 2)
            cv2.line(img, pts2, pts6, (0,255,0), 2)
            cv2.line(img, pts3, pts7, (0,255,0), 2)
            cv2.line(img, pts4, pts8, (0,255,0), 2)

            # save images
            camera_name = label2camera[camera_label]
            img_file = output_dir + ('/image_%s_' % datetime.now().strftime('%Y%m%d-%H%M%S') + camera_name + '.jpg')
            print(img_file, "saved.")
            cv2.imwrite(img_file, img)


def lidar_camera2visual(cameras: np.array, pred_boxes2d, pixel_poses, msgcamera: MsgCamera, output_dir: str):
    """
        cameras: [[camera1, camera2, ...],[camera1, camera2, ...], ...] -> each [camera1, camera2,...] represents a vehicle
        pixel_poses: [[vehicle1], [vehicle2], ...]
            vehicle: [camera1, camera2, ...]
            camera:  [[x1 x2 y1 y2], [x1 x2 y1 y2], [], ...]
                     -> each [x1 x2 y1 y2] reprensents 4 coordinates of a point and  there are 8 points
        pred_boxes2d: [[vehicle1],[vehicl2], ...]
            vehicle: [x1,x2,y1,y2] -> only one camera
    """
    os.makedirs(output_dir, exist_ok=True)

    # label2camera
    label2camera = {
        1: 'camera11', 2: 'camera12', 3: 'camera13', 4: 'camera14',
        5: 'camera41', 6: 'camera42', 7: 'camera43', 8: 'camera44'
    }

    for camera, pred_box2d, pixel_pose in zip(cameras, pred_boxes2d, pixel_poses):
        # process single image
        camera_label = camera[0]
        pixel_pose_cur_camera = pixel_pose[0]
        img = msgcamera.camera[camera_label-1]
        img = CvBridge().imgmsg_to_cv2(img, 'bgr8')
        # get 8 pts
        pts1 = (round(pixel_pose_cur_camera[0][0]), round(pixel_pose_cur_camera[0][1]))
        pts2 = (round(pixel_pose_cur_camera[1][0]), round(pixel_pose_cur_camera[1][1]))
        pts3 = (round(pixel_pose_cur_camera[2][0]), round(pixel_pose_cur_camera[2][1]))
        pts4 = (round(pixel_pose_cur_camera[3][0]), round(pixel_pose_cur_camera[3][1]))
        pts5 = (round(pixel_pose_cur_camera[4][0]), round(pixel_pose_cur_camera[4][1]))
        pts6 = (round(pixel_pose_cur_camera[5][0]), round(pixel_pose_cur_camera[5][1]))
        pts7 = (round(pixel_pose_cur_camera[6][0]), round(pixel_pose_cur_camera[6][1]))
        pts8 = (round(pixel_pose_cur_camera[7][0]), round(pixel_pose_cur_camera[7][1]))

        # draw 12 lines
        cv2.line(img, pts1, pts2, (0,0,255), 1)
        cv2.line(img, pts2, pts3, (0,0,255), 1)
        cv2.line(img, pts3, pts4, (0,0,255), 1)
        cv2.line(img, pts4, pts1, (0,0,255), 1)

        cv2.line(img, pts5, pts6, (0,0,255), 1)
        cv2.line(img, pts6, pts7, (0,0,255), 1)
        cv2.line(img, pts7, pts8, (0,0,255), 1)
        cv2.line(img, pts8, pts5, (0,0,255), 1)

        cv2.line(img, pts1, pts5, (0,0,255), 1)
        cv2.line(img, pts2, pts6, (0,0,255), 1)
        cv2.line(img, pts3, pts7, (0,0,255), 1)
        cv2.line(img, pts4, pts8, (0,0,255), 1)

        if len(pred_box2d) != 0:
            # draw pred_box2d
            pts9 = (round(pred_box2d[0]), round(pred_box2d[1]))
            pts10 = (round(pred_box2d[2]), round(pred_box2d[3]))
            cv2.rectangle(img, pts9, pts10, (255,0,0), 1)

        # save images
        camera_name = label2camera[camera_label]
        img_file = output_dir + ('/image_%s_' % datetime.now().strftime('%Y%m%d-%H%M%S') + camera_name + '.jpg')
        print(img_file, "saved.")
        cv2.imwrite(img_file, img)