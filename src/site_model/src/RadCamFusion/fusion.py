# !/usr/bin/env python3
"""
Get the radar and camera messages and do Radar-camera fusion.
"""

from time import perf_counter
from pathlib import Path
import argparse
import yaml
import numpy as np
from typing import List, Tuple

import cv2
from cv_bridge import CvBridge

import rospy
import message_filters
from sensor_msgs.msg import Image  # Camera message
from msgs.msg._MsgRadarObject import MsgRadarObject
from msgs.msg._MsgRadar import MsgRadar  # Radar message
from msgs.msg._MsgRadCam import MsgRadCam  # fusion message

from ..utils.yolo.yolo import YOLO
from ..utils.kalman import Kalman
from ..utils.poi_and_roi import image_roi
from ..utils.visualization import VisualAssistant
from ..utils.sensor_and_obs import RadarSensor, ImageSensor, SensorPair

time_counter = 0
frame_counter = 0
geometry = {}

CUDA = False

ROOT_DIR = ''
CONFIG_FILE = ''
YOLO_DIR = ''
OUTPUT_DIR = ''
SAVE_DIR = ''
GEOMETRY_FILE = ''
BASE_IMAGE_FILE = ''

# TODO: find out the proper threshold
IOU_THRESHOLD = 0.5
SCENE_THRESHOLD = 1.0
MAX_AGE = 3

Q = np.eye(2) * 1.


def my_timer() -> float:
    global time_counter, frame_counter
    print('+------------------------+')
    frame_counter += 1
    my_now = perf_counter()
    del_time = my_now - time_counter
    print("\033[0;36mFrame {}, FPS: {:.2f}\033[0m".format(frame_counter, 1.0 / del_time))
    time_counter = my_now
    return del_time


def my_file_loader() -> None:
    global ROOT_DIR, CONFIG_FILE, YOLO_DIR, OUTPUT_DIR, GEOMETRY_FILE, BASE_IMAGE_FILE
    global geometry

    ROOT_DIR = Path(__file__).resolve().parents[2]
    YOLO_DIR = ROOT_DIR.joinpath("src/utils/yolo")
    # load config file
    CONFIG_FILE = ROOT_DIR.joinpath("config/config.yaml")
    with open(CONFIG_FILE, 'r') as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    OUTPUT_DIR = ROOT_DIR.joinpath(config['output']['RadCamFusion_dir'])
    BASE_IMAGE_FILE = ROOT_DIR.joinpath(config['visual_assistant']['base_image'])
    # load geometry file
    GEOMETRY_FILE = ROOT_DIR.joinpath("config/geometry.yaml")
    with open(GEOMETRY_FILE, 'r') as f:
        geometry = yaml.load(f, Loader=yaml.FullLoader)


def rad2data(radar: List[MsgRadarObject]) -> np.ndarray:
    if len(radar) == 0:
        return np.empty((0, 3))
    else:
        radar_data = np.array([np.array([obj.distance, obj.angle_centroid, obj.velocity]) for obj in radar])
        return radar_data


def msg2data(radar: List[MsgRadarObject], image: Image) -> Tuple[np.ndarray, np.ndarray]:
    global yolo
    radar_data = rad2data(radar)
    image_data = image_roi(image, yolo)
    return radar_data, image_data


def msg2save(frame: int, save_path: Path, radar_data: List[np.ndarray], radar_sensors: List[RadarSensor],
             image_data: List[Image], image_sensors: List[ImageSensor]) -> None:
    p = save_path.joinpath(str(frame))
    for r, s in zip(radar_data, radar_sensors):
        np.savetxt(str(p.joinpath("{}.txt".format(s.name))), r)
    for i, s in zip(image_data, image_sensors):
        i = CvBridge().imgmsg_to_cv2(i, 'bgr8')
        cv2.imwrite(str(p.joinpath("{}.png".format(s.name))), i)
    print("\033[0;32mSaved radar and image data sucessfully.\033[0m")


def save2data(frame: int, load_path: Path, radar_sensors: List[RadarSensor], image_sensors: List[ImageSensor]) -> None:
    p = load_path.joinpath(str(frame))
    for s in radar_sensors:
        d = np.loadtxt(str(p.joinpath("{}.txt".format(s.name))))
        s.update(d)
    for s in image_sensors:
        d = np.loadtxt(str(p.joinpath("{}.txt".format(s.name))))
        s.update(d)
    print("\033[0;32mLoaded radar and image data sucessfully.\033[0m")


def fusion(radar: MsgRadar, image_2: Image, image_3: Image) -> None:
    global frame_counter
    global kf, va, args
    global pair_2, pair_3
    # Output FPS and frame info
    _ = my_timer()
    # Off-YOLO mode (only save radar and raw image data)
    if args.mode == 'off-yolo':
        msg2save(frame_counter, radar.objects_left, image_2, SAVE_DIR)
        return
    # Acquire radar and image data
    if args.mode == 'from-save':
        radar_data_2, image_data_2 = save2data(SAVE_DIR, '2')
    else:
        radar_data_2, image_data_2 = msg2data(radar.objects_left, image_2)
        radar_data_3, image_data_3 = msg2data(radar.objects_right, image_3)
    # Update sensor pairs and get observations
    pair_2.update(radar_data_2, image_data_2)
    zs_2 = pair_2.observe()
    pair_3.update(radar_data_3, image_data_3)
    zs_3 = pair_3.observe()
    # Fuse and print detection results
    zs = zs_2 + zs_3
    print("\033[0;36mDetection\033[0m", zs, sep='\n')
    # Kalman Filter
    # A = np.eye(2)
    # kf.flush(A, zs)
    # print("\033[0;36mKalman Filter\033[0m", kf, sep='\n')
    # Visual assistant
    if args.save:
        va.scene_output(frame_counter, zs, kf)
        va.image_output(frame_counter, image_2, cam_5)
        va.image_output(frame_counter, image_3, cam_6)
    # Publish
    msg_rad_cam = MsgRadCam()
    msg_rad_cam.num_overpass = zs.total_objs
    msg_rad_cam.header.stamp = rospy.Time.now()
    pub.publish(msg_rad_cam)


if __name__ == '__main__':
    # set command arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("-m",
                        "--mode",
                        choices=['normal', 'off-yolo', 'from-save'],
                        type=str,
                        default='normal',
                        required=False,
                        help="Mode.")
    parser.add_argument("-s",
                        "--save",
                        action='store_true',
                        default=False,
                        required=False,
                        help="Save visualized POIs and ROIs as images.")
    args = parser.parse_args()

    my_file_loader()

    # Initialization
    # YOLO
    if args.mode != 'off-yolo':
        yolo = YOLO(YOLO_DIR, cuda=CUDA)
        print("\033[0;32mYOLO initialized successfully.\033[0m")
    else:
        yolo = None
        print("\033[0;33mRunning in off-YOLO mode.\033[0m")
    # Sensors
    # Radars
    rad_2 = RadarSensor("Radar_2", geometry['radars']['radar_2'])
    rad_3 = RadarSensor("Radar_3", geometry['radars']['radar_3'])
    # Cameras
    cam_2 = ImageSensor("Image_2", geometry['cameras']['camera_2'], rad_2.offset[2])
    cam_3 = ImageSensor("Image_3", geometry['cameras']['camera_3'], rad_3.offset[2])
    cam_5 = ImageSensor("Image_5", geometry['cameras']['camera_5'], rad_2.offset[2])
    cam_6 = ImageSensor("Image_6", geometry['cameras']['camera_6'], rad_3.offset[2])
    cam_7 = ImageSensor("Image_7", geometry['cameras']['camera_7'], rad_2.offset[2])
    # Sensor Pairs
    pair_2 = SensorPair(rad_2, cam_5, IOU_THRESHOLD)
    pair_3 = SensorPair(rad_3, cam_6, IOU_THRESHOLD)
    # Kalman Filter
    kf = Kalman(2, Q, SCENE_THRESHOLD, MAX_AGE)
    # Visual Assistant
    va = VisualAssistant(BASE_IMAGE_FILE, OUTPUT_DIR)

    # initialize publisher
    pub = rospy.Publisher("/radar_camera_fused", MsgRadCam, queue_size=10)
    # initialize ROS node
    rospy.init_node('radar_camera_fusion', anonymous=True)
    # initialize publisher
    pub = rospy.Publisher("/radar_camera_fused", MsgRadCam, queue_size=10)
    # subscribe messages
    msg_radar = message_filters.Subscriber('/radar_msgs_combined', MsgRadar)
    msg_image_2 = message_filters.Subscriber('/image_raw_2', Image)
    msg_image_3 = message_filters.Subscriber('/image_raw_3', Image)
    msg_image_5 = message_filters.Subscriber('/image_raw_5', Image)
    msg_image_6 = message_filters.Subscriber('/image_raw_6', Image)
    msg_image_7 = message_filters.Subscriber('/image_raw_7', Image)
    # syncronize time stamps
    sync = message_filters.ApproximateTimeSynchronizer([msg_radar, msg_image_5, msg_image_6], 1, 1)
    sync.registerCallback(fusion)
    print("\033[0;32mRadar-camera Fusion Initialized Sucessfully.\033[0m")
    rospy.spin()
