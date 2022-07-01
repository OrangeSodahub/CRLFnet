#!/usr/bin/env python3

"""
Get the radar and camera messages and do Radar-camera fusion.
"""


from time import process_time
from pathlib import Path
import argparse
import yaml
import numpy as np

import rospy
import message_filters
from sensor_msgs.msg import Image               # Camera message
from msgs.msg._MsgRadar import MsgRadar         # Radar message
from msgs.msg._MsgRadCam import MsgRadCam       # fusion message

from radar_poi import radar_poi
from image_roi import image_roi
from yolo.yolo import YOLO

from utils.visualization import radar2visual    # visualized output


def single_fusion(radar_pois: list, image_rois: list):
    pass


def fusion(radar: MsgRadar, image2: Image, image3: Image):
    # DO NOT initialize YOLO repeatedly!
    global OUTPUT_DIR
    global calib
    global yolo
    global pub
    global loop_counter

    # counter for debugging
    print("\033[1;36mLoop Counter:\033[0m", loop_counter)
    loop_counter += 1
    print("Process Time:", process_time())

    # Convert messages to POIs and ROIs
    # get Radar POIs
    radar_pois_left, radar_pois_right = radar_poi(radar, calib, image2.width, image2.height, image3.width, image3.height)
    # get Image ROIs
    image_rois_left  = image_roi(image2, yolo=yolo)
    image_rois_right = image_roi(image3, yolo=yolo)
    # print POIs and ROIs
    print("\033[1;36mDetailed POI / ROI Information:\033[0m")
    print("Left Radar POIs: \t", radar_pois_left)
    print("Right Radar POIS:\t", radar_pois_right)
    print("Left Image ROIs: \t", image_rois_left)
    print("Right Image ROIs:\t", image_rois_right)

    # fusion (The output of radar_poi and image_roi are not standard!!!)
    # detection flags
    radar_left  = len(radar_pois_left)
    image_left  = len(image_rois_left)
    radar_right = len(radar_pois_right)
    image_right = len(image_rois_right)
    match_left  = 0
    match_right = 0
    # left
    for rpoi in radar_pois_left:
        for iroi in image_rois_left:
            if(iroi[0] <= rpoi[0][0] <= iroi[2] and iroi[1] <= rpoi[1][0] <= iroi[3]):
                match_left += 1
    for rpoi in radar_pois_right:
        for iroi in image_rois_right:
            if(iroi[0] <= rpoi[0][0] <= iroi[2] and iroi[1] <= rpoi[1][0] <= iroi[3]):
                match_right += 1
    # print detection results
    print("\033[1;36mDetection Statistics:\033[0m")
    print("Radar Left: {},\tRadar Right: {}".format(radar_left, radar_right))
    print("Image Left: {},\tImage Right: {}".format(image_left, image_right))
    print("Match Left: {},\tMatch Right: {}".format(match_left, match_right))

    # publish the results
    msg_rad_cam = MsgRadCam()
    msg_rad_cam.radar_left   = radar_left
    msg_rad_cam.radar_right  = radar_right
    msg_rad_cam.camera_left  = image_left
    msg_rad_cam.camera_right = image_right
    msg_rad_cam.match_left   = match_left
    msg_rad_cam.match_right  = match_right
    msg_rad_cam.header.stamp = rospy.Time.now()
    pub.publish(msg_rad_cam)

    # output visualized results
    if params.save_result:
        if radar_left != 0 and image_left != 0:
            radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, draw_radar=True, draw_image=True, appendix='L')
        if radar_right != 0 and image_right != 0:
            radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, draw_radar=True, draw_image=True, appendix='R')

    # print an empty line as sepration
    print()


if __name__ == '__main__':
    # counter for debugging
    loop_counter = 0

    # set command arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--save_result",
                        action = 'store_true',
                        default = False,
                        help = "Output visualized POIs and ROIs",
                        required = False
                        )
    params = parser.parse_args()

    # get root path
    ROOT_DIR = Path(__file__).resolve().parents[2]
    # load config file
    CONFIG_DIR = ROOT_DIR.joinpath("config/config.yaml")
    with open(CONFIG_DIR, 'r') as f:
        try:
            config = yaml.load(f, Loader=yaml.FullLoader)
        except:
            print("\033[1;31mFailed to load config file.\033[0m")
            exit(1)
    OUTPUT_DIR = ROOT_DIR.joinpath(config['output']['RadCamFusion_dir'])
    CALIB_DIR = ROOT_DIR.joinpath(config['calib']['calib_dir'], 'calib.txt')
    # load calib file
    calib = np.loadtxt(CALIB_DIR)

    # initialize YOLO
    yolo = YOLO()

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
