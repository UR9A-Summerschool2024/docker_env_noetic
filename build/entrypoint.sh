#!/bin/bash

cd /home/docker/catkin_ws

# source ros
source /opt/ros/noetic/setup.bash

# Run the main container command
exec "$@"
