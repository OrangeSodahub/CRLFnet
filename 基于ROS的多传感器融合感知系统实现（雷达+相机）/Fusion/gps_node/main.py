import numpy as np
from sklearn import cluster
from math import sqrt
import time
import rospy
from sensor_msgs.msg import NavSatFix
from std_msgs.msg import Float32
from vincenty import vincenty
 
class Speedometer:
    def __init__(self):
        self._prev_data = None
        self._current_data = None
        self._prev_time = None
        self._curr_time = None
        
        rospy.init_node('gps_node', anonymous=True)

        rospy.Subscriber("/fix", NavSatFix, self.callback_gps)
        self.pub_speed = rospy.Publisher("/gps_node/speed", Float32, queue_size=10)
        self.pub_heading = rospy.Publisher("/gps_node/heading", Float32, queue_size=10)

        rospy.spin()

    def feed(self, data):
        self._prev_data = self._current_data
        self._current_data = data
        self._prev_time = self._curr_time
        self._curr_time = time.time()

    def speed(self):
        if not self._prev_data or not self._current_data:
            return 0 # no data
        else: 
            prev_pos = (self._prev_data.latitude, self._prev_data.longitude)
            curr_pos = (self._current_data.latitude, self._current_data.longitude)
            speed = vincenty(prev_pos, curr_pos)*1000 / (self._curr_time-self._prev_time)
            return speed

    def heading(self):
        return 0

    def callback_gps(self, data):

        self.feed(data)
        print(self.speed())
        self.pub_speed.publish(Float32(self.speed()))
        self.pub_heading.publish(Float32(self.heading()))


if __name__ == '__main__':

    sp = Speedometer()


