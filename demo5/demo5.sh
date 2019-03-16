#!/bin/sh

echo "stop and remove container if running"
sudo docker container stop cp_api_sshd1
sudo docker container rm cp_api_sshd1
sleep 5

echo "remove old ssh_keys"
rm ./docker/ssh_keys/id_rsa
rm ./docker/ssh_keys/id_rsa.pub
sleep 5

echo "Genereate keys for the docker containers to use."
/usr/bin/ssh-keygen -q -t rsa -N '' -f ./docker/ssh_keys/id_rsa
sleep 5

echo "Build the image from the Dockerfile"
sudo docker build --tag=sshd_cp_mgt_api ./docker/
sleep 5

echo "Create the docker container from the image."
echo "Also send in the local ssh_keys as the container .ssh folder"
sudo docker run -d -P -v "$(pwd)"/docker/ssh_keys:/home/cygate/.ssh --name cp_api_sshd1 sshd_cp_mgt_api
sleep 5

echo "Check the container is running again"
sudo docker ps
