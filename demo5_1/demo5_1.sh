#!/bin/sh

# stop and remove container if running
docker container stop checkpoint_api_01
docker container rm checkpoint_api_01

# Build the image from the Dockerfile
docker build --tag=checkpoint_api ./docker/

# Create the Management network in docker.
docker network list | grep -q "mgt_net" || docker network create "mgt_net"

# Create the docker container from the image.
# Also send in the local ssh_keys as the container .ssh folder
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  --name checkpoint_api_01 checkpoint_api
sleep 1

#Check the container is running again
docker ps
