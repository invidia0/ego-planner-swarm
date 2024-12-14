FROM osrf/ros:noetic-desktop-full

USER root

ENV ROS_DISTRO=noetic
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN  apt-get update && apt-get upgrade -y && apt-get install -y \
    gcc \
    git \
    libxml2-dev \
    libxslt-dev \
    python3 \
    python3-pip\ 
    python3-scipy \
    ros-noetic-tf\
    ros-noetic-interactive-markers\
    ros-noetic-image-geometry\
    ros-noetic-xacro \
    sqlite3 \
    ffmpeg \
    build-essential \
    curl \
    nano \
    wget \
    terminator \
    libarmadillo-dev \
    # AMD OpenCL GPU drivers
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install setuptools
RUN pip3 install pykalman catkin-tools numpy scipy matplotlib

# Copy your ROS packages into the workspace
COPY . /workspace/src

WORKDIR /workspace

# RUN catkin build
RUN . /opt/ros/noetic/setup.sh && catkin_make

# Source the ROS setup file
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /workspace/devel/setup.bash" >> ~/.bashrc

# Set entrypoint
ENTRYPOINT ["/bin/bash"]