#!/usr/bin/env python3

"""
Get the radar and camera messages and do Radar-camera fusion.
"""


from time import perf_counter
from pathlib import Path
import argparse
import yaml
import numpy as np
from typing import List

import rospy
import message_filters
from sensor_msgs.msg import Image               # Camera message
from msgs.msg._MsgRadarObject import MsgRadarObject
from msgs.msg._MsgRadar import MsgRadar         # Radar message
from msgs.msg._MsgRadCam import MsgRadCam       # fusion message

from ..utils.yolo.yolo import YOLO
from ..utils.kalman import Kalman
from ..utils.poi_and_roi import radar_poi, image_roi, expand_poi, optimize_iou
from ..utils.visualization import VisualAssistant
from ..utils.sensor_and_obs import RadarSensor, ImageSensor, FusedSensor, ObsBundle


time_counter = 0
frame_counter = 0


class SensorPair:

    def __init__(self, R: np.ndarray, radar_sensor: RadarSensor, image_sensor: ImageSensor) -> None:
        self.radar = radar_sensor
        self.image = image_sensor
        self.fused_sensor = FusedSensor(R, [radar_sensor, image_sensor], [1.0, 0.0])

    def update(self, radar_data: List[MsgRadarObject], image_data: np.ndarray) -> None:
        if len(radar_data) == 0:
            radar_data = np.empty((0, 3))
        else:
            radar_data = np.array([np.array([obj.distance, obj.angle_centroid, obj.velocity]) for obj in radar_data])
        self.radar.update(radar_data)
        self.image.update(image_data)

    def observe(self) -> ObsBundle:
        radar_pois = radar_poi(self.radar.obs2world(), self.image.w2c, self.image.c2p, self.image.target_height)
        image_rois = self.image.boxes[0:4]
        # IOU matching
        radar_expanded_rois = np.array(list(map(
            lambda p, d: expand_poi(p, d, self.image.size[0],self.image.size[1]),
            radar_pois, self.radar.zs[:, 0])),
            dtype=int)
        # TODO: find out the proper threshold
        fused_rad_idx, fused_cam_idx = optimize_iou(radar_expanded_rois, image_rois, threshold=0.0)
        # get observation bundle
        fused_zs = np.concatenate([self.radar.zs[fused_rad_idx, 0:3], self.image.zs[fused_cam_idx, 0:2]], axis=1)
        self.fused_sensor.update(fused_zs)
        self.radar.obs_filter(fused_rad_idx)
        self.image.obs_filter(fused_cam_idx)
        # TODO: improve code
        zs, ss = [], []
        ps = np.concatenate([self.fused_sensor.obs2world(), self.radar.obs2world(), self.image.obs2world()], axis=0)
        for s in [self.fused_sensor, self.radar, self.image]:
            for z in s.zs:
                zs.append(z)
                ss.append(s)
        return ObsBundle(zs, ps, ss)


def my_timer():
    global time_counter, frame_counter
    print('+------------------------+')
    my_now = perf_counter()
    del_time = my_now - time_counter
    print("\033[0;36mFrame {}, FPS: {:.2f}\033[0m".format(frame_counter, 1.0 / del_time))
    frame_counter += 1
    time_counter = my_now
    return del_time


def fusion(radar: MsgRadar, image2: Image, image3: Image):
    global time_counter, frame_counter
    global kf, va
    global pair_2, pair_3

    # Output FPS and Frame Info
    time_interval = my_timer()
    # Observe and find out repeated objects
    pair_2.update(radar.objects_left, image_roi(image2, yolo))
    zs_2 = pair_2.observe()
    print("\033[0;36mDetection\033[0m", zs_2, sep='\n')
    # Kalman Filter
    A = np.eye(2)
    kf.flush(A, zs_2)
    print("\033[0;36mKalman Filter\033[0m", kf, sep='\n')

    va.scene_output(frame_counter, zs_2, kf)
    """
    # Save Images
    if args.save and radar_obj_num !=0 and image_obj_num != 0:
        radar2visual(OUTPUT_DIR, self.image, radar_pois=radar_pois, radar_rois=radar_expanded_rois, image_rois=image_rois, appendix='Test')

    va.scene_output(kf.xpt_pile, self.radar.zs, self.image.zs, frame_counter)
    """


if __name__ == '__main__':
    # set command arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--off-yolo",
                        action      = 'store_true',
                        default     = False,
                        required    = False,
                        help        = "Disable yolo, save radar POIs and images per frame instead."
    )
    parser.add_argument("-s", "--save",
                        action      = 'store_true',
                        default     = False,
                        required    = False,
                        help        = "Save visualized POIs and ROIs as images."
    )
    parser.add_argument("-t", "--trigger",
                        choices     = ['match', 'both', 'either', 'anyway'],
                        type        = str,
                        default     = 'match',
                        required    = False,
                        help        = "When to save images."
    )
    args = parser.parse_args()

    # get root path
    ROOT_DIR = Path(__file__).resolve().parents[2]
    # load config file
    CONFIG_FILE = ROOT_DIR.joinpath("config/config.yaml")
    with open(CONFIG_FILE, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print("\033[1;31mFailed to load config file.\033[0m")
            exit(1)
    OUTPUT_DIR = ROOT_DIR.joinpath(config['output']['RadCamFusion_dir'])
    MEASUREMENT_FILE = ROOT_DIR.joinpath(config['measurement']['measurement_dir'], 'measurement.txt')
    BASE_IMAGE_FILE = ROOT_DIR.joinpath("src/utils/visual/scene_base.png")
    # load measurement file
    camera_index = {'camera11': 0, 'camera12': 1, 'camera13': 2, 'camera14': 3,
                    'camera2' : 4, 'camera3' : 5,
                    'camera41': 6, 'camera42': 7, 'camera43': 8, 'camera44': 9}
    measurement = np.loadtxt(MEASUREMENT_FILE)
    w2cs, c2ps = {}, {}
    for c in camera_index.keys():
        w2cs[c] = measurement[camera_index[c]][0:16].reshape(4, 4)
        c2ps[c] = measurement[camera_index[c]][16:28].reshape(3, 4)
    del measurement

    # Initialization
    # YOLO
    if not args.off_yolo:
        yolo = YOLO(ROOT_DIR, cuda=False)
        print("\033[0;32mYOLO initialized successfully.\033[0m")
    else:
        yolo = None
        print("\033[0;33mRunning in off-YOLO mode.\033[0m")
    # Sensors
    # Radars
    R = np.eye(2) * 0.01
    rad_2 = RadarSensor("radar_2", R, np.array([-1.59824637808195, -0.790114867663065, 0.461]))
    rad_3 = RadarSensor("radar_3", R, np.array([0.964315628564147, 0.200335452740542, 0.461]))
    # Cameras
    R = np.eye(2) * 32
    cam_2 = ImageSensor("image_2", R, w2cs['camera2'], c2ps['camera2'], 640, 480, 0.461)
    cam_3 = ImageSensor("image_3", R, w2cs['camera3'], c2ps['camera3'], 640, 480, 0.461)
    # Sensor Pairs
    R = np.diag([0.01, 0.01, 32, 32])
    pair_2 = SensorPair(R, rad_2, cam_2)
    pair_3 = SensorPair(R, rad_3, cam_3)
    # Kalman Filter
    Q = np.eye(2) * 1.
    kf = Kalman(2, Q, 10.0, 3)
    # Visual Assistant
    va = VisualAssistant(BASE_IMAGE_FILE, OUTPUT_DIR)

    # initialize publisher
    pub = rospy.Publisher("/radar_camera_fused", MsgRadCam, queue_size=10)
    # initialize ROS node
    rospy.init_node('radar_camera_fusion', anonymous=True)
    # subscribe messages
    msg_radar   = message_filters.Subscriber('/radar_msgs_combined', MsgRadar)
    msg_image_2 = message_filters.Subscriber('/image_raw_2', Image)
    msg_image_3 = message_filters.Subscriber('/image_raw_3', Image)
    # syncronize time stamps
    sync = message_filters.ApproximateTimeSynchronizer([msg_radar, msg_image_2, msg_image_3], 1, 1)
    sync.registerCallback(fusion)
    print("\033[0;32mRadar-camera Fusion Initialized Sucessfully.\033[0m")
    rospy.spin()
