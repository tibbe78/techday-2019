#!/bin/sh

# stop and remove container if running
docker container stop cp_api_img
docker container rm cp_api_img

# Build the image from the Dockerfile
docker build --tag=cp_api_img ./docker/

# Create the Management network in docker.
docker network list | grep -q "mgt_net" || docker network create "mgt_net"

# Create the docker container from the image.
# Also send in the local ssh_keys as the container .ssh folder
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  --name cp_api1 cp_api_img
sleep 1

# Check the container is running again
docker ps -s --format "table {{.Names}}: {{.Size}}: {{.RunningFor}}"

# Check memory usage
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
