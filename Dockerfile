# humble, jazzy
ARG ROS_DISTRO=humble

FROM ros:${ROS_DISTRO}-ros-base
ENV ROS_DISTRO=${ROS_DISTRO}

RUN apt update && apt install -y \
    python3-rosinstall
RUN apt update && apt install -y \
    libeigen3-dev

RUN sudo apt update && apt install -y \
    python3-shapely \
    python3-yaml \
    python3-requests \
    python3-colcon-clean \
    python3-pip \
    python3-rosdep \
    python3-vcstool \
    python3-colcon-common-extensions

RUN apt update && apt install -y \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-vision-opencv \
    python3-opencv


RUN echo "alias bros2='cd ${HOME}/ros2_ws && source /opt/ros/${ROS_DISTRO}/setup.bash && colcon build && source ${HOME}/ros2_ws/install/setup.bash'" >> ~/.bashrc
RUN echo "alias sros2='source /opt/ros/${ROS_DISTRO}/setup.bash && source ${HOME}/ros2_ws/install/setup.bash'" >> ~/.bashrc
RUN echo "echo 'Welcome to ROS2 ${ROS_DISTRO} docker container'" >> ~/.bashrc
RUN echo "echo 'Leaving the ROS2 ${ROS_DISTRO} Docker container. Goodbye!'" >> ~/.bash_logout

WORKDIR /ros2_ws
