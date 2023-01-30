# Manually Drive Your AWS DeepRacer

The aim of this project is to document how to manually drive an AWS DeepRacer vehicle using a joystick controller or a steering wheel. Out-of-the-box you can do this using a mouse with the vehicle's built-in user interface but it is a lot more fun to drive the car around with a joystick or steering wheel.

## History

The history of this project:
* this is a fork from https://github.com/lshw54/awsdeepracer_control
* which was a refactor from https://github.com/thu2004/deepracer-vehicle-api 
* which was a refactor from https://github.com/ARCC-RACE/deepracer-rc

## Project Changes

* Combined some of the original project dependencies to simplify the project
* Refactor of the project threading to improve race condition issues
* Updating libaries
* Updated reflect changes to AWS DeepRacer APIs
* Adding documention for testing compatible joysticks based on the Pygame library
* More documentation for building and deploying the application
* Adding more joystick type support and easier to support new joystick types

## About AWS DeepRacer

There are lots of ways to learn about machine learning and robotics but AWS DeepRacer is the most fun way to do it.

You will first need an AWS DeepRacer vehicle which you can order from amazon.com. There are two models: the standard AWS DeepRacer that is 1/18 scale race car with a single camera; and an AWS DeepRacer Evo model which includes the standard model and an extra kit with a second camera, lidar sensor, and a larger shell for the vehicle. You can get started with the standard model and you can add the sensor kit later once you are ready for building advance machine learning models on the car.

### Learning About Machine Learning

You can learn about machine learning at the AWS website.


### Learning About Robotics

https://github.com/aws-deepracer/aws-deepracer-launcher
https://aws.amazon.com/deepracer/robotics-projects/

If you want to AWS DeepRacer code is now open source and available on github.



## Pygame - Python for Video Games

[Pygame](https://www.pygame.org) is a set of Python modules designed for writing video games. This project uses Pygame's joystick library to translate input from compatible joysticks. The joystick input is translated to PUT requests to the DeepRacer API. The AWS DeepRacer cars exposes an API to control the vehicle using the Robot Operating System (ROS2). The Pygame website includes instructions for [getting started](https://www.pygame.org/wiki/GettingStarted) with Pygame.

To drive an AWS DeepRacer car using this library, you first need to test if the joystick you want to use works with Pygame. If it does not work with Pygame then you can't use this library.

### Compatible Pygame Joysticks

I have tested these joysticks with Pygame. It seems to more luck with simpler, older joysticks that are compatible with many gaming systems, over new joysticks that are compatible with 1-2 gaming systems.

* Tested November 2021 with Windows 10 - Nacon PlayStation 4 Controller Orange (a wired PS4 generic USB controller)
* Tested November 2021 with Windows 10 - PXN V3II Simulate Racing Game Steering Wheel with Pedal, 180 Degree Steering Wheel, Compatible with Windows PC, PS3, PS4, Xbox One, Nintendo Switch-Orange (a wired generic USB steering wheel)
* Unverified but seen in a video - Logitech G29 steering wheel

### Incompatible Joysticks

* Tested November 2021 - Logitech G923 Steering Wheel for Xbox - Pygame detects joystick but not the buttons

### Testing Joysticks with Pygame

To test that the joysticks work with the Pygame library, run these tests:

```bash
python .\test\pygame_joystick_simple_test.py
python .\test\pygame_joystick_full_test.py
```

## Installation

### First Installation with Python and Git

For Windows, a simple way to install Python3 and Git is with Chocolatey - the package manager for Windows - https://github.com/lshw54/awsdeepracer_control

* Install python3 ```choco install python```
* Install git ```choco install git```

### Installing Project Dependencies

* Checkout the repository ```git clone https://github.com/jacobcantwell/deepracer_api.git```
* Change to the directory ```cd deepracer_api```
* Create a Python virtual environment
    * in a Windows powershell ```python -m venv venv```
    * in a Linux bash shell ```python3 -m venv venv```
* Activate the Python virtual environment
    * in a Windows powershell ```.\venv\Scripts\activate```
    * in a linux bash shell ```. venv/bin/activate```
* Install the Python requirements ```pip install -r requirements.txt```

### Environmental Variable Setup

After installation, you need to set some environmental variables for the project.

* Create a new `.env` file in the root directory of your project.
* Add a **LOCAL_IP** value for the local IP address of the car.
* Add a **DEEPRACER_PASSWORD** value the DeepRacer UI password.

```yaml
LOCAL_IP=[local-ip]
DEEPRACER_PASSWORD=[password]
```

## Controlling DeepRacer

The scripts for controlling with different joysticks are similar except for how the joystick input from Pygame is translated to AWS DeepRacer input.

### Controlling DeepRacer With a generic PS4 joystick

To control with a generic PS4 joystick, run:

```bash
python ps4_mode.py
```

### Controlling DeepRacer With a PS4 joystick

To control with a generic steering wheel, run:

```bash
python steering_wheel_mode.py
```

### Testing a Seperate Camera Feed

The AWS DeepRacer car includes a 640x480 colour camera and publishes a video stream to a ROS2 topic. You can view the video stream by opening the topic as seen in this python script below. Open a seperate terminal to run this script and you can control and view the AWS DeepRacer car at the same time.

```bash
python show_cam.py
```



## Previous Fork Notes

* run the `setup.sh` file to setup your IP and password it will generate a `hostname_passord` file to save your IP and password.
* choose which mode you need then run to `start` sh file
* docker run -it --rm --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" g29
* docker run -it --rm -e password=xxxx -e hostIp=yyyy g29
* Testing on Windows, Ubuntu, MacOS (with USB port)
* G29 Mode is not supporting on Linux
