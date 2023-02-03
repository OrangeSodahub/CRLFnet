import platform
import logging
import sys
import time

from aws_deepracer_control_v3 import Client
# Used to manage how fast the screen updates.

# get operating system
get_os = platform.system()

# configure logging
logging.getLogger().addHandler(logging.StreamHandler(sys.stdout))
logging.getLogger().setLevel(logging.INFO)

# global variables used for DeepRacer manual driving
steer = 0
drive = 0
max_speed = 0.3


PASSWORD = "alwUOgky"
LOCAL_IP = "192.168.0.110"


def main():
    client = Client(password=PASSWORD, ip=LOCAL_IP)
    logging.info("print vehicle info")
    client.show_vehicle_info()
    car_battery_level = client.get_battery_level()
    logging.info(u"car_battery_level %s", car_battery_level)
    logging.info("set to manual mode.")
    client.set_manual_mode()
    # throttle = client.get_calibration_throttle()
    # logging.info(u"throttle %s", throttle)
    logging.info("start the car")
    client.start_car()
    global drive, steer, max_speed

    try:
        while True:
            logging.info("looping...")
            client.move(1, 1, max_speed)
            time.sleep(3)
            client.move(-1, -1, max_speed)
            time.sleep(2)
            client.stop_car()
            time.sleep(1)
    except KeyboardInterrupt:
        print("EXITING NOW")
        client.stop_car()

if __name__ == "__main__":
    main()
