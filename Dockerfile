FROM ros:noetic

# ROS noetic installation
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y curl vim \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y ros-noetic-jsk-* ros-noetic-dynamic-reconfigure \
    && rm -rf /var/lib/apt/lists/*

# workspace
ENV ROS_WS /etc/ros_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS
COPY patchwork-plusplus-ros $ROS_WS/src/patchwork
RUN . /opt/ros/noetic/setup.sh \
    && catkin_make 		

ENV XDG_RUNTIME_DIR=/etc/xdg_runtime_dir
RUN mkdir /etc/xdg_runtime_dir

# setup entrypoint
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

