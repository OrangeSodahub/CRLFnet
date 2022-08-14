ARG PYTORCH="1.11.0"
ARG CUDA="11.3"

FROM osrf/ros:noetic-desktop-focal
ADD sources.list /etc/apt/

# Install ROS
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*

# Install CRLFnet
RUN apt-get update
RUN apt-get install -y git
RUN cd /home/ && git clone https://github.com/OrangeSodahub/CRLFnet.git