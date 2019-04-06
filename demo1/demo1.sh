#!/bin/sh

# install Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version

# Genereate keys for the Ansible host if they don't exist
# and that they are secure with the passphrase and ssh-agent
# but these should be secured with some smart way.
if [ ! -f ~/.ssh/id_rsa ]; then
  passphrase="$(openssl rand -base64 20 | md5sum | sed 's/ .*//')"
  /usr/bin/ssh-keygen -q -t rsa -N "${passphrase}" -f ~/.ssh/id_rsa
  echo "paste this into agent: ${passphrase}"
  ssh-add -q ~/.ssh/id_rsa
  passphrase="empty again..."
fi

# copy the public key to server1
# this can also be done via Ansible
ssh-copy-id server1.mylocal

# test to SSH to server without password
ssh server1
