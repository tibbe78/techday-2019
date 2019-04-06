### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## Ansible Demo 5.2 :whale::ballot_box_with_check::metal:
### Use the new Ansible module and docker container to push a change to the [CheckPoint](https://www.checkpoint.com/) MGT
> In this demo my Docker host is the same as Ansible host running Ubuntu 18.10
> Docker is already installed
> The container from demo 5.1 is running
#### Install the CheckPoint module for Ansible
#### Using CheckPoints Ansible module https://github.com/CheckPointSW/cpAnsible
```sh
git clone https://github.com/CheckPointSW/cpAnsible
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules
```
#### configure the checkpoint api settings.
> We use the docker connection instead of SSH to connect to host.
> Also add your checkpoint MGT server info.
```INI
[checkpoint_api]
cp_api02  ansible_connection=docker

[checkpoint_api:vars]
# IP to your checkpoint mgt server
mgmt_server=172.16.59.20
mgmt_user=admin
# mgmt_password=It's in the vault
```
#### installing netaddr for python to do ip address filter a bit nicer
```sh
sudo apt install python-netaddr
```
> Playbooks can be run in check mode with -C. Then no changes will be done.
### [Demo 6](../demo6/) :blue_book::green_book::orange_book:
Show how roles can simplify playbook complexity
