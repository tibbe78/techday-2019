#!/bin/sh

# Pull the image from the public dockerhub
docker pull rundeck/rundeck:3.0.19

# Create the Management network in docker.
docker network list | grep -q "mgt_net" || docker network create "mgt_net"

# Create SSH keys to use with docker container
if [ ! -f ./ssh_keys/id_rsa ]
then /usr/bin/ssh-keygen -q -t rsa -N "" -f ./ssh_keys/id_rsa
fi

# Create the docker container from the image.
# Also send in the local ssh_keys as the container .ssh folder
docker run --name rundeck -d -p 4440:4440 \
 --network='mgt_net' --network-alias mgt \
 --mount type=bind,source="$(pwd)"/ssh_keys,target=/home/rundeck/.ssh \
 --mount type=bind,source="$(pwd)"/container_data,target=/home/rundeck/server/data \
 rundeck/rundeck:3.0.19

# Or create all via Ansible
ansible-playbook -i inventory.ini create_docker.yml

# Check the container is running again
docker ps -s --format "table {{.Names}}: {{.Size}}: {{.RunningFor}}"

# Check memory usage
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
