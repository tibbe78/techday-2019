# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 5.1 :whale::point_up:

### Build a docker container with Ansible or console commands to use with CheckPoint MGT

> in this demo my Docker host is the same as Ansible host running Ubuntu 18.10
> Docker is already installed

#### Create docker group and add user to this group. ReInit group.
> So we don't need to sudo for docker jobs
```sh
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

#### install docker python on your docker host. (same as my ansible host)
> so ansible can talk to this. I had problems with python2 so had to run python3 for some stuff later.
```sh
pip install docker
```

#### Create a dockerfile with the [CheckPoint MGT API](https://github.com/CheckPointSW/cp_mgmt_api_python_sdk) in a empty folder (I call this folder docker)
> This is what Ansible will start to create docker image
```dockerfile
# Use the Ubuntu 18.04 as the base image
FROM ubuntu:18.04
MAINTAINER FullName <email@Address>
RUN apt-get update
RUN apt-get install -y git python-pip
# Install the checkpoint MGT API via pip on the host.
RUN pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk
# Entrypoint is like CMD but it always runs. Plus I fake a deamon to run always.
ENTRYPOINT ["tail", "-f", "/dev/null"]
```

### Two choices here. either use Ansible to deploy docker container or do it via console.
#### For Ansible deploy only do:
```sh
ansible-playbook -i inventory playbook.yml
```

#### Otherwise do all commands below:
#### Create docker network
```sh
docker network list | grep -q "mgt_net" || docker network create "mgt_net"
```

#### Build docker image from the dockerfile in the local catalog docker
```sh
docker build --tag=checkpoint_api ./docker/
```

#### Start the Docker container and name it checkpoint_api_01
> checkpoint_api is the image name/tag from previous command.
```sh
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  --name checkpoint_api_01 checkpoint_api
```

### Both Ansible and Commandline version can check from here
#### check if container is running
```sh
docker ps
```

#### Optional: logon to the container with shell
```sh
docker exec -it checkpoint_api_01 bash
```

### [Demo 5.2](../demo5_2/) :whale::metal:
Next Demo 5.2 (Secure our sudo password with Ansible Vault)
