#!/bin/sh

# stop and remove container if running
docker container stop checkpoint_api_01
docker container rm checkpoint_api_01

# remove old ssh_keys
#rm ./docker/ssh_keys/id_rsa
#rm ./docker/ssh_keys/id_rsa.pub

# Genereate keys for the docker containers to use if they don't exist
if [ ! -f ./docker/ssh_keys/id_rsa ]; then
    /usr/bin/ssh-keygen -q -t rsa -N '' -f ./docker/ssh_keys/id_rsa
fi

# Build the image from the Dockerfile
docker build --tag=checkpoint_api ./docker/

# Create the Management network in docker.
docker network list | grep -q "mgt_net" || docker network create "mgt_net"


# Create the docker container from the image.
# Also send in the local ssh_keys as the container .ssh folder
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  -v "$(pwd)"/docker/ssh_keys:/home/cygate/.ssh \
  --name checkpoint_api_01 checkpoint_api
sleep 1

#Check the container is running again
docker ps
