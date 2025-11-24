#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh
source ${PROJECT_ROOT}/config_local.sh

docker run -it \
  --name=${DOCKER_CONTAINER_NAME} \
  --network ${DOCKER_NETWORK} \
  --volume ${PROJECT_ROOT}/ros2_ws:/ros2_ws \
  --volume /dev:/dev \
  --privileged \
  --rm \
  ${DOCKER_IMAGE_NAME} /bin/bash
