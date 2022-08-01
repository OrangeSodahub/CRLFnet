import rospy
from pathlib import Path
from datetime import datetime
import numpy as np

from sensor_msgs.msg import Image
from msgs.msg._MsgCamera import MsgCamera
from geometry_msgs.msg import Point
from visualization_msgs.msg import Marker, MarkerArray

from cv_bridge import CvBridge
import cv2

from .sensor_and_obs import ObsBundle, RadarSensor, ImageSensor, FusedSensor
from .kalman import Kalman


class VisualAssistant:
    
    def __init__(self, base_image_path: Path, output_path: Path):
        self.base_image = cv2.imread(str(base_image_path))
        self.output_path = output_path
        self.w2s = np.array([[0, -1, 3], [-1, 0, 2], [0, 0, 1]]) * 200

    def scene_output(self, frame: int, zs: ObsBundle, kf: Kalman):
        for z, p, s in zip(zs.zs, zs.projections, zs.sensors):
            if isinstance(s, ImageSensor):
                my_color = (255, 0, 0)
            elif isinstance(s, RadarSensor):
                my_color = (0, 255, 0)
            elif isinstance(s, FusedSensor):
                my_color = (255, 255, 0)
            else:
                my_color = (0, 0, 0)
            c = np.matmul(self.w2s, [p[0], p[1], 1.]).astype(int)
            cv2.circle(self.base_image, c[0:2], 3, my_color, -1)
        for x in kf.xpts:
            my_color = (0, 0, 255)
            c = np.matmul(self.w2s, [x[0], x[1], 1.]).astype(int)
            cv2.circle(self.base_image, c[0:2], 5, my_color, -1)
        file_name = "scene_{:04d}.jpg".format(frame)
        cv2.imwrite(str(self.output_path.joinpath(file_name)), self.base_image)
        print("\033[0;32mSaved scene {} sucessfully.\033[0m".format(frame))
    
    def image_output(self, frame: int, image: Image, camera: ImageSensor):
        pass

    def image_range(self):
        pass
        '''
        def grid2scene(self):
            print("Please wait.")
            for x in range(0, 640):
                for y in range(0, 480):
                    vi = p2w(np.array([x, y, 1]), 0.461, self.w2c, self.c2p)[0]
                    p = np.matmul(self.w2s, np.array([vi[0], vi[1], 1])).astype(int)
                    cv2.circle(self.base_image, (p[0], p[1]), 1, (x/3, y/3, 0), -1)
            cv2.imwrite(str(self.output_path.joinpath("grid.jpg")), self.base_image)
            print("GRID")
        '''


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
    """
        box3d: 2-d coordinates
    """
    if isinstance(img, Image):
        img = CvBridge().imgmsg_to_cv2(img, 'bgr8')

    lines = [[0, 1], [1, 2], [2, 3], [3, 0], [4, 5], [5, 6],
         [6, 7], [7, 4], [0, 4], [1, 5], [2, 6], [3, 7]]

    # get 8 pts
    pts = []
    for i in range(8):
        pts.append((round(box3d[i][0], round(box3d[i][1]))))

    # draw 12 lines
    for line in lines:
        cv2.line(img, pts[line[0]], pts[line[1]], color, 1)

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


def display_rviz(boxes3d, vehicles, gt_boxes3d=None) -> MarkerArray:
    """
        boxes3d: 3-d coordinates
    """

    marker_array = MarkerArray()
    marker_array.markers.clear()

    def process_single_box3d(box3d, id, type):
        lines = [[0, 1], [1, 2], [2, 3], [3, 0], [4, 5], [5, 6],
                [6, 7], [7, 4], [0, 4], [1, 5], [2, 6], [3, 7]]

        points_set = []
        for point in box3d:
            points_set.append(Point(point[0], point[1], point[2]))

        marker = Marker()
        marker.header.frame_id = 'base_link'
        marker.header.stamp = rospy.Time.now()

        marker.id = id
        marker.action = Marker.ADD
        marker.type = Marker.LINE_LIST

        marker.lifetime = rospy.Duration(0)

        if type == "matched":                                                   # matched vehicle
            marker.color.r, marker.color.g, marker.color.b = 0, 1, 0
        elif type == "unmatched":                                               # unmatched vehicle
            marker.color.r, marker.color.g, marker.color.b = 1, 1, 1
        elif type == "gt":                                                      # ground truth
            marker.color.r, marker.color.g, marker.color.b = 0, 1, 1

        marker.color.a = 1
        marker.scale.x = 0.01                                                   # width of lines
        marker.points = []

        for line in lines:
            marker.points.append(points_set[line[0]])
            marker.points.append(points_set[line[1]])

        return marker

    # Add pred_boxes3d
    for id_pred in range(len(boxes3d)):
        box3d = boxes3d[id_pred]
        if id_pred in vehicles:
            marker = process_single_box3d(box3d, id_pred, "matched")
        else:
            marker = process_single_box3d(box3d, id_pred, "unmatched")
        marker_array.markers.append(marker)

    # Add gt_boxes3d
    if gt_boxes3d is not None:
        for id_gt in range(len(gt_boxes3d)):
            gt_box3d = gt_boxes3d[id_gt]
            marker = process_single_box3d(gt_box3d, id_gt+len(boxes3d), "gt")
            marker_array.markers.append(marker)

    return marker_array
