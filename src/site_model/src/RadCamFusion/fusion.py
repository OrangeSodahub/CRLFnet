# !/usr/bin/env python3
"""
Get the radar and camera messages and do Radar-camera fusion.
"""

from time import perf_counter, sleep
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
from ..utils.sensor_and_obs import ObsBundle, RadarSensor, ImageSensor, SensorCluster

import warnings

warnings.filterwarnings("ignore")

time_counter = 0
frame_counter = 0
geometry = {}

CUDA = False

YOLO_DIR = Path()
OUTPUT_DIR = Path()
SAVE_DIR = Path()
LOAD_DIR = Path()
BASE_IMAGE_FILE = Path()

MODEL_SIZE = 0
A = np.empty((0, 0))
Q = np.empty((0, 0))
MAX_AGE = 0
THRES_IOU = 0
THRES_SCENE = 0


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
    global YOLO_DIR, OUTPUT_DIR, BASE_IMAGE_FILE, SAVE_DIR, LOAD_DIR
    global CUDA, A, Q, THRES_IOU, THRES_SCENE, MAX_AGE, MODEL_SIZE
    global geometry

    ROOT_DIR = Path(__file__).resolve().parents[2]
    YOLO_DIR = ROOT_DIR.joinpath("src/utils/yolo")

    # load config file
    config_file = ROOT_DIR.joinpath("config/config.yaml")
    with open(config_file, 'r') as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    CUDA = config['use_cuda']
    OUTPUT_DIR = ROOT_DIR.joinpath(config['output']['RadCamFusion_dir'])
    SAVE_DIR = OUTPUT_DIR.joinpath("save")
    SAVE_DIR.mkdir(exist_ok=True)
    LOAD_DIR = OUTPUT_DIR.joinpath("load")
    BASE_IMAGE_FILE = ROOT_DIR.joinpath(config['visual_assistant']['base_image'])

    # load geometry file
    geometry_file = ROOT_DIR.joinpath("config/geometry.yaml")
    with open(geometry_file, 'r') as f:
        geometry = yaml.load(f, Loader=yaml.FullLoader)
    MODEL_SIZE = geometry['scene']['kalman']['model_size']
    A = np.array(geometry['scene']['kalman']['A']).reshape((MODEL_SIZE, MODEL_SIZE))
    Q = np.array(geometry['scene']['kalman']['Q']).reshape((MODEL_SIZE, MODEL_SIZE))
    MAX_AGE = geometry['scene']['kalman']['max_age']
    THRES_IOU = geometry['scene']['kalman']['iou_thres']
    THRES_SCENE = geometry['scene']['kalman']['scene_thres']


def raw_radar_process(radar: List[MsgRadarObject]) -> np.ndarray:
    if len(radar) == 0:
        return np.empty((0, 3))
    else:
        radar_data = np.array([np.array([obj.distance, obj.angle_centroid, obj.velocity]) for obj in radar])
        return radar_data


def msg2data(raw_radar_data: List[List[MsgRadarObject]], images: List[Image]) -> Tuple[List[np.ndarray], List[np.ndarray]]:
    global yolo
    radar_data, image_data = [], []
    for rd in raw_radar_data:
        radar_data.append(raw_radar_process(rd))
    for img in images:
        image_data.append(image_roi(img, yolo))
    return radar_data, image_data


def msg2save(frame: int, save_path: Path, raw_radar_data: List[List[MsgRadarObject]], images: List[Image],
             sensor_cluster: SensorCluster) -> None:
    radar_data = list(map(raw_radar_process, raw_radar_data))
    p = save_path.joinpath(str(frame))
    p.mkdir(exist_ok=True)
    for r, s in zip(radar_data, sensor_cluster.radar_sensors):
        np.savetxt(str(p.joinpath("{}.txt".format(s.name))), r)
    for i, s in zip(images, sensor_cluster.image_sensors):
        i = CvBridge().imgmsg_to_cv2(i, 'bgr8')
        cv2.imwrite(str(p.joinpath("{}.png".format(s.name))), i)
    print("\033[0;32mSaved radar and image data of frame {} sucessfully.\033[0m".format(frame))


def save2data(frame: int, load_path: Path, sensor_cluster: SensorCluster) -> Tuple[List[np.ndarray], List[np.ndarray]]:
    p = load_path.joinpath(str(frame))
    if not p.exists:
        raise FileNotFoundError("The frame doesn't exist.")
    radar_data, image_data = [], []
    for s in sensor_cluster.radar_sensors:
        d = np.loadtxt(str(p.joinpath("{}.txt".format(s.name))), dtype=float)
        d = d.reshape((-1, s.box_size))
        radar_data.append(d)
    for s in sensor_cluster.image_sensors:
        d = np.loadtxt(str(p.joinpath("{}.txt".format(s.name))), dtype=int)
        d = d.reshape((-1, s.box_size))
        image_data.append(d)
    print("\033[0;32mLoaded radar and image data of frame {} sucessfully.\033[0m".format(frame))
    return radar_data, image_data


def fusion(radar: MsgRadar, image_2: Image, image_3: Image, image_5: Image, image_6: Image, image_7: Image) -> None:
    global frame_counter
    global sensor_cluster, kf, va, args
    # Output FPS and frame info
    _ = my_timer()
    # Off-YOLO mode (only save radar and raw image data)
    if args.mode == 'off-yolo':
        msg2save(frame_counter, SAVE_DIR, [radar.objects_left, radar.objects_right],
                 [image_2, image_3, image_5, image_6, image_7], sensor_cluster)
        sleep(0.05)  # fps ~ 20
        return
    # Acquire radar and image data
    radar_data, image_data = msg2data([radar.objects_left, radar.objects_right], [image_2, image_3, image_5, image_6, image_7])
    zs = fusion_core(radar_data, image_data, sensor_cluster)
    # Visual assistant
    if args.save:
        va.scene_output(frame_counter, zs, kf)
    # Publish
    msg_rad_cam = MsgRadCam()
    msg_rad_cam.num_overpass = zs.total_objs
    msg_rad_cam.header.stamp = rospy.Time.now()
    pub.publish(msg_rad_cam)


def fusion_core(radar_data: List[np.ndarray], image_data: List[np.ndarray], sensor_cluster: SensorCluster) -> ObsBundle:
    global frame_counter
    global kf, va, args
    global A
    # Update sensor and acquire observation (including fusion)
    sensor_cluster.update(radar_data, image_data)
    zs = sensor_cluster.observe()
    print("\033[0;36mDetection\033[0m", zs, sep='\n')
    # Kalman Filter
    kf.flush(A, zs)
    print("\033[0;36mKalman Filter\033[0m", kf, sep='\n')
    return zs


if __name__ == '__main__':
    # Set Command Arguments
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
                        help="Save the track of the targets as images.")
    args = parser.parse_args()

    my_file_loader()

    # Initialization
    # YOLO
    if args.mode == 'normal':
        yolo = YOLO(YOLO_DIR, cuda=CUDA)
        print("\033[0;32mYOLO initialized successfully.\033[0m")
    else:
        yolo = None
        print("\033[0;33mRunning in off-YOLO mode.\033[0m")
    # Radars
    rad_2 = RadarSensor("Radar_2", geometry['radars']['radar_2'])
    rad_3 = RadarSensor("Radar_3", geometry['radars']['radar_3'])
    # Cameras
    cam_2 = ImageSensor("Image_2", geometry['cameras']['camera_2'], rad_2.offset[2])
    cam_3 = ImageSensor("Image_3", geometry['cameras']['camera_3'], rad_3.offset[2])
    cam_5 = ImageSensor("Image_5", geometry['cameras']['camera_5'], rad_2.offset[2])
    cam_6 = ImageSensor("Image_6", geometry['cameras']['camera_6'], rad_3.offset[2])
    cam_7 = ImageSensor("Image_7", geometry['cameras']['camera_7'], rad_2.offset[2])
    # Sensor Cluster
    sensor_cluster = SensorCluster([rad_2, rad_3], [cam_2, cam_3, cam_5, cam_6, cam_7])
    # Kalman Filter
    kf = Kalman(MODEL_SIZE, Q, THRES_SCENE, MAX_AGE)
    # Visual Assistant
    va = VisualAssistant(BASE_IMAGE_FILE, OUTPUT_DIR)

    # From-Save Mode
    if args.mode == 'from-save':
        frame = 0
        while True:
            try:
                frame += 1
                radar_data, image_data = save2data(frame, LOAD_DIR, sensor_cluster)
            except FileNotFoundError:
                print("\033[0;32mTraversed all {} frames.\033[0m".format(frame))
                exit(0)
            finally:
                zs = fusion_core(radar_data, image_data, sensor_cluster)
                # Visual assistant
                if args.save:
                    va.scene_output(frame, zs, kf)

    # Initialize Publisher
    pub = rospy.Publisher('/radar_camera_fused', MsgRadCam, queue_size=10)
    # Initialize ROS Node
    rospy.init_node('radar_camera_fusion', anonymous=True)
    # Subscribe Messages
    msg_radar = message_filters.Subscriber('/radar_msgs_combined', MsgRadar)
    msg_image_2 = message_filters.Subscriber('/image_raw_2', Image)
    msg_image_3 = message_filters.Subscriber('/image_raw_3', Image)
    msg_image_5 = message_filters.Subscriber('/image_raw_5', Image)
    msg_image_6 = message_filters.Subscriber('/image_raw_6', Image)
    msg_image_7 = message_filters.Subscriber('/image_raw_7', Image)
    # Syncronize Time Stamps
    sync = message_filters.ApproximateTimeSynchronizer(
        [msg_radar, msg_image_2, msg_image_3, msg_image_5, msg_image_6, msg_image_7], 1, 1)
    sync.registerCallback(fusion)
    print("\033[0;32mRadar-camera Fusion Initialized Sucessfully.\033[0m")
    rospy.spin()
