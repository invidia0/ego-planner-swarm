#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please provide the docker name or id. These are your options:"
    docker ps -a
    exit 1
fi

xhost +local:root

docker exec -it \
    $@ \
    /bin/bash
    