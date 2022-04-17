#############################################################
#   This py file subscribe the topic of radars and save     #
#	the poses information of vehicles.						#
#   Author: Yangxiuyu                                       #
#############################################################

from sqlalchemy import true
import rospy
from per_msgs.msg import _SensorMsgsRadar # Radar message class

def radar_listener():
    rospy.init_node('radar_listener', anonymous=true)
    rate = rospy.Rate(10) # publish msgs rated at 10Hz

    pub = 

if __name__ == '__main__':
    try:
        radar_listener()
    except rospy.ROSInterruptException:
        pass