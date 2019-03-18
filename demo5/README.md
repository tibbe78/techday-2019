# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 5 :whale:

### Build a docker container with Ansible to use with CheckPoint MGT

Using CheckPoints Ansible module https://github.com/CheckPointSW/cpAnsible

# Create docker group and add user to this group. ReInit group.
> Now we don't need to sudo for docker
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

#### install docker python on your docker host.
> so ansible can talk to this.
```sh
pip install docker
```

#### install the [CheckPoint MGT API](https://github.com/CheckPointSW/cp_mgmt_api_python_sdk) in a Docker container via the Dockerfile
> This is what Ansible needs to talk to.
```sh
apt install -y python-pip
pip install -y git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk
```

#### Generate new keys for your docker container
```sh
/usr/bin/ssh-keygen -q -t rsa -N '' -f ./docker/ssh_keys/id_rsa
```

#### Create docker network
docker network list | grep -q "mgt_net" || docker network create "mgt_net"

#### Build docker file
```sh
docker build --tag=cp_mgt_api ./docker/
```

#### Start the Docker container
```sh
docker run -d -P \
  --network='mgt_net' \
  --network-alias mgt \
  -v "$(pwd)"/docker/ssh_keys:/home/cygate/.ssh \
  --name cp_mgt_api01 cp_mgt_api
```

#### check if it's runnin
docker ps

#### logon to the container with shell
docker exec -it cp_mgt_api01 bash

### [Demo 6](../demo6/) :dog:
Next Demo 6 (Secure our sudo password with Ansible Vault)
