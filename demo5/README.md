# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 5 :whale:

### Build a docker container with Ansible to use with CheckPoint MGT

> in this demo my Docker host is the same as Ansible host running Ubuntu 18.10
> Docker is already installed

#### Using CheckPoints Ansible module https://github.com/CheckPointSW/cpAnsible
```sh
git clone https://github.com/CheckPointSW/cpAnsible
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules
```

#### Create docker group and add user to this group. ReInit group.
> So we don't need to sudo for docker jobs
```sh
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

#### install docker python on your docker host.
> so ansible can talk to this.
```sh
pip install docker
```

#### Create a dockerfile with the [CheckPoint MGT API](https://github.com/CheckPointSW/cp_mgmt_api_python_sdk) in a empty folder
> This is what Ansible will start to create docker image
```dockerfile
FROM ubuntu:18.04
MAINTAINER FullName <email@Address>
RUN apt-get update
RUN apt-get install -y git python-pip
RUN pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk
ENTRYPOINT ["tail", "-f", "/dev/null"]
```

#### Create docker network
```sh
docker network list | grep -q "mgt_net" || docker network create "mgt_net"
```

#### Build docker file
```sh
docker build --tag=checkpoint_api ./docker/
```

#### Start the Docker container
```sh
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  --name checkpoint_api_01 checkpoint_api
```

#### check if it's running
```sh
docker ps
```

#### logon to the container with shell
```sh
docker exec -it checkpoint_api_01 bash
```

### [Demo 6](../demo6/) :dog:
Next Demo 6 (Secure our sudo password with Ansible Vault)
