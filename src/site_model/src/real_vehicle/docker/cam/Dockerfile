FROM python:3.7-slim

LABEL MAINTAINER="lshw.5454@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y apt-utils 2>&1 | grep -v "debconf: delaying package configuration, since apt-utils is not installed"
RUN apt-get install -y libgtk2.0-dev pkg-config && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN pip install --upgrade pip

WORKDIR /deepracer
ADD . /deepracer
COPY . /deepracer

RUN pip install awsdeepracer_control
RUN pip install opencv-contrib-python==3.4.3.18

CMD ["python", "show_cam.py"]