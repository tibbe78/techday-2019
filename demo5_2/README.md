# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 5.2 :whale::metal:

### Connect to the new CheckPoint docker container via Ansible and do stuff..

> In this demo my Docker host is the same as Ansible host running Ubuntu 18.10

> Docker is already installed

> The container from demo 5.1 is running
#### Install the CheckPoint module for Ansible
#### Using CheckPoints Ansible module https://github.com/CheckPointSW/cpAnsible
```sh
git clone https://github.com/CheckPointSW/cpAnsible
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules
```

### [Demo 6](../demo6/) :dog:
Next Demo 6 (Secure our sudo password with Ansible Vault)
