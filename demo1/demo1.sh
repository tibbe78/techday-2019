#!/bin/sh

# install Ansible
cd
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version

# Genereate keys for the Ansible host if they don't exist
if [ ! -f .ssh/id_rsa ]; then
    /usr/bin/ssh-keygen -q -t rsa -N '' -f .ssh/id_rsa
fi

# copy the public key to server1
# this can also be done via Ansible
ssh-copy-id server1.mylocal

# test to SSH to server without password
ssh server1
