#!/bin/sh

# 1 install Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version

# 2
ansible-playbook -i inventory --vault-password-file .vaultpass --extra-vars '@vaultfile.yml' techday.yml

apt install python-pip
pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk
git clone https://github.com/CheckPointSW/cpAnsible

cp -r /etc/ansible/ ./
cd ansible
vim ansible.cfg
#Edit this in file
inventory      = ./ansible/hosts
library        = /usr/share/my_modules/

#copy checkpoint
cd cpAnsible/
mv ./check_point_mgmt /usr/share/my_modules


ansible-playbook -i inventory --ask-become-pass techday.yml


ansible-vault create sudo_passwd.yml
# write this in vault
ubuntu_servers_sudo_pass = cygate
ansible-playbook -i inventory --vault-password-file .vaultpass --extra-vars '@vaultfile.yml' techday.yml
