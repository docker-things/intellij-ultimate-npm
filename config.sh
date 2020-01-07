#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="intellij-ultimate-npm"

# BUILD ARGS
BUILD_ARGS=(
    --build-arg INTELLIJ_DOWNLOAD_URL="https://download-cf.jetbrains.com/idea/ideaIU-2019.3.1.tar.gz"
    --build-arg NODE_DOWNLOAD_URL="https://deb.nodesource.com/setup_12.x"
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    --memory="12g"
    --cpu-shares=1024

    -v $(pwd)/data:/home/$(whoami)
    -v /home/$(whoami):/home/host
    -v /media:/media

    --rm
    -d
    )
