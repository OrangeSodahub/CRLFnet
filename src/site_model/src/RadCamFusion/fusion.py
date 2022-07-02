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

from .radar_poi import radar_poi
from ..utils.image_roi import image_roi
from ..utils.yolo.yolo import YOLO

from ..utils.visualization import radar2visual    # visualized output


def fusion(radar: MsgRadar, image2: Image, image3: Image):
    # DO NOT initialize YOLO repeatedly!
    global OUTPUT_DIR
    global calib
    global yolo
    global pub
    global my_timer
    global args

    # counter for debugging
    if args.information:
        print("\033[1;36m--------------------------------\033[0m")
        print("\033[1;36mFPS:\033[0m {:.2f}".format(1.0 / (process_time() - my_timer)))
        my_timer = process_time()

    # Convert messages to POIs and ROIs
    # get Radar POIs
    radar_pois_left, radar_pois_right = radar_poi(radar, calib, image2.width, image2.height, image3.width, image3.height)
    # get Image ROIs
    image_rois_left  = image_roi(image2, yolo=yolo)
    image_rois_right = image_roi(image3, yolo=yolo)
    # print POIs and ROIs
    if args.information:
        print("\033[1;36mDetailed POI / ROI Information:\033[0m")
        print("Left Radar POIs:")
        for p in radar_pois_left:
            print("\t({},\t{})".format(p[0][0], p[1][0]))
        print("Right Radar POIS:")
        for p in radar_pois_right:
            print("\t({},\t{})".format(p[0][0], p[1][0]))
        print("Left Image ROIs:")
        for p in image_rois_left:
            print("\t({:.0f},\t{:.0f},\t{:.0f},\t{:.0f}),\t{:.2f}".format(p[0], p[1], p[2], p[3], p[4]*p[5]))
        print("Right Image ROIs:")
        for p in image_rois_right:
            print("\t({:.0f},\t{:.0f},\t{:.0f},\t{:.0f}),\t{:.2f}".format(p[0], p[1], p[2], p[3], p[4]*p[5]))

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
    if args.information:
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

    # save images
    if args.save:
        if args.trigger == 'match':
            if match_left != 0:
                radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            if match_right != 0:
                radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, appendix='R')
        elif args.trigger == 'both':
            if radar_left != 0 and image_left != 0:
                radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            if radar_right != 0 and image_right != 0:
                radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, appendix='R')
        elif args.trigger == 'either':
            if radar_left != 0 or image_left != 0:
                radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            if radar_right != 0 or image_right != 0:
                radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, appendix='R')
        elif args.trigger == 'radar':
            if radar_left != 0:
                radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            if radar_right != 0:
                radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right,appendix='R')
        elif args.trigger == 'image':
            if image_left != 0:
                radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            if image_right != 0:
                radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, appendix='R')
        else:
            radar2visual(OUTPUT_DIR, image2, radar_pois_left, image_rois_left, appendix='L')
            radar2visual(OUTPUT_DIR, image3, radar_pois_right, image_rois_right, appendix='R')


if __name__ == '__main__':
    # counter for debugging
    my_timer = 0

    # set command arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--information",
                        action      = 'store_true',
                        default     = False,
                        required    = False,
                        help        = "Print POIs, ROIs and statistics."
                        )
    parser.add_argument("-s", "--save",
                        action      = 'store_true',
                        default     = False,
                        required    = False,
                        help        = "Save visualized POIs and ROIs as images."
    )
    parser.add_argument("-t", "--trigger",
                        choices     = ['match', 'both', 'either', 'radar', 'image', 'anyway'],
                        type        = str,
                        default     = 'match',
                        required    = False,
                        help        = "When to save images."
    )
    args = parser.parse_args()

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
    yolo = YOLO(ROOT_DIR)

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
