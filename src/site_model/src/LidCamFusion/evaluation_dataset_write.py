from email.mime import image
import os
from pathlib import Path
import argparse
import rospy
import message_filters
import ros_numpy
import numpy as np
from PIL import Image

from sensor_msgs.msg import PointCloud2                 # pointcloud type
from nav_msgs.msg import Odometry                       # odometry type
from msgs.msg._MsgCamera import *                       # Image type: camera msgs class


odoms = []
counter = 0
def writter(pcd: PointCloud2, img: MsgCamera, odom: Odometry):
    global odoms, counter
    points = convert_ros_pointcloud_to_numpy(pcd)
    odoms.append([odom.pose.pose.position.x, odom.pose.pose.position.y,
                odom.pose.pose.orientation.w, odom.pose.pose.orientation.x,
                odom.pose.pose.orientation.y, odom.pose.pose.orientation.z])
    # imgs = np.array([np.reshape(ros_numpy.numpify(image), (1, 640, -1))[0] for image in img.camera])
    # imgs = np.reshape(imgs, (1, -1, imgs.shape[2]))[0]
    imgs = [ros_numpy.numpify(image) for image in img.camera]
    for i, image in enumerate(imgs):
        image = Image.fromarray(image)
        os.makedirs(os.path.join(params.dir, 'img/{}'.format(counter)), exist_ok=True)
        image.save(os.path.join(params.dir, 'img/{}/{}.jpg'.format(counter, i)))
    
    np.savetxt(os.path.join(params.dir, 'pcd/{}.txt'.format(counter)), points)
    if counter == 2000:
        odoms = np.array(odoms)
        np.savetxt(os.path.join(params.dir, 'odom/{}.txt'.format(counter)), odoms)
        print("\033[0;32mdodoms #{} done.\033[0m".format(counter))
    print("{} done.".format(counter), end='\r')
    counter += 1


def convert_ros_pointcloud_to_numpy(pointcloud: PointCloud2):
    pc = ros_numpy.numpify(pointcloud)
    points = np.zeros((pc.shape[0],4))
    points[:,0] = pc['x']
    points[:,1] = pc['y']
    points[:,2] = pc['z']
    return points


if __name__ == '__main__':
    # get ROOT DIR
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir", help="path to test dataset file", metavar="FILE", required=False, default= str(ROOT_DIR / 'dataset/test_dataset'))
    params = parser.parse_args()

    rospy.init_node('lidar_camera_fusion', anonymous=True)

    sub_pcd = message_filters.Subscriber('/point_cloud_combined', PointCloud2)
    sub_img = message_filters.Subscriber('/camera_msgs_combined', MsgCamera)
    sub_odom = message_filters.Subscriber('/deepracer1/base_pose_ground_truth', Odometry)
    sync = message_filters.ApproximateTimeSynchronizer([sub_pcd, sub_img, sub_odom], 1, 1) # syncronize time stamps
    sync.registerCallback(writter)
    print("Lidar Camera Record Begin.")
    rospy.spin()