# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 5 :whale:

### Build a docker container with Ansible to use with CheckPoint MGT

Using CheckPoints Ansible module https://github.com/CheckPointSW/cpAnsible

#### install the [CheckPoint MGT API](https://github.com/CheckPointSW/cp_mgmt_api_python_sdk) in a Docker container via the Dockerfile
> This is what Ansible needs to talk to.
```sh
apt install -y python-pip
pip install -y git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk
```
#### Generate keys for your docker container
```sh
/usr/bin/ssh-keygen -q -t rsa -N '' -f ./docker/ssh_keys/id_rsa
```

#### Build docker file
```sh
sudo docker build --tag=sshd_cp_mgt_api ./docker/
```

#### Start the Docker container
```sh
sudo docker run -d -P -v "$(pwd)"/docker/ssh_keys:/home/cygate/.ssh --name cp_api_sshd1 sshd_cp_mgt_api
```

### [Demo 6](../demo6/) :dog:
Next Demo 6 (Secure our sudo password with Ansible Vault)
