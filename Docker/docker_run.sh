#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please provide the image name e.g., “egoplannerswarm”."
    exit 1
fi

xhost +local:root

docker run -it \
    --net=host \
    --ipc=host \
    --device=/dev/dri \
    --group-add video \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY=$DISPLAY" \
    $@