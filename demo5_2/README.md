### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## Ansible Demo 5.2 :whale::ballot_box_with_check::metal:
### Use the new Ansible module and docker container to push a change to the [CheckPoint](https://www.checkpoint.com/) MGT
> In this demo my Docker host is the same as Ansible host running Ubuntu 18.10\
> Docker is already installed\
> The container from demo 5.1 is running
#### Install the CheckPoint module for Ansible
#### Using [CheckPoints Ansible module](https://github.com/CheckPointSW/cpAnsible)
> /usr/share/my_modules is the default place for ansible modules but can be put elsewhere also
```sh
git clone https://github.com/CheckPointSW/cpAnsible
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules
```
#### configure the checkpoint api settings in the inventory.
> We use the docker connection instead of SSH to connect to host.\
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
#### Then there is alot of settings in the different yml files.
> [fw_policy_changes.yml](fw_policy_changes.yml) contains the information about the changes I wan't to do. it's easy to read and it's used i the actual playbooks.\
> [add_fw_obj.yml](add_fw_obj.yml) is the playbook that adds the information from the fw_policy changes to the Firewall\
> [del_fw_obj.yml](del_fw_obj.yml) just removes it again. so I can easily repeat the demo.
#### we include the fw_policy_changes.yml in our playbook so we can reference the values
```yml
- hosts: checkpoint
  become: false
  gather_facts: false
  vars_files:
    - vault_prod.yml
    - fw_policy_changes.yml
```
#### in the playbook we can loop a task with the list of hosts in the varible fw_hosts
> In this example this task will run three times because the fw_hosts contains list of three hosts.\
> **when:** will check agains the boolean varible in the top of fw_policy_changes if this task should run.\
> **"{{ item.ip | ipaddr }}"** will actually use the python-netaddr function ipaddr to check that it's a correct ip before installing.
```yml
- name: "loop fw_hosts and add new host "
  check_point_mgmt:
    command: add-host
    parameters:
      name: "{{ item.name }}"
      ip-address: "{{ item.ip | ipaddr }}"
    session-data: "{{ login_response }}"
  loop: "{{ fw_hosts }}"
  when: add_new_host
```
#### to add the policys to the firewall just run the playbook add_fw_obj.yml
> First check that the checkpoint api container is running first.
```sh
docker ps
ansible-playbook -i inventory.ini add_fw_obj.yml
```
> Playbooks can be run in check mode with -C. Then no changes will be done.
```sh
ansible-playbook -C -i inventory.ini add_fw_obj.yml
```
### [Demo 6](../demo6/) :blue_book::green_book::orange_book:
Show how roles can simplify playbook complexity
