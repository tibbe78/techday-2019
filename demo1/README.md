# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 1 :dvd:

### Install Ansible

#### Add Ansibles official repository via PPA (Personal Package Archives).
```sh
sudo apt-add-repository ppa:ansible/ansible
```

#### update [APT (Advanced Package Tool)](https://en.wikipedia.org/wiki/APT_(Debian)) to get the latest package info.
```sh
sudo apt update
```

#### run apt to install Ansible.
```sh
sudo apt install ansible
```

#### Check that Ansible was installed with the latest version.
> As of writing it's 2.7.9
```sh
ansible --version
```

#### Generate ssh-keys on Ansible master (already exists in demo)
> not needed if this already have been done in install

> this bash script checks if the key already exist.
```sh
if [ ! -f .ssh/id_rsa ]; then
    /usr/bin/ssh-keygen -q -t rsa -N '' -f .ssh/id_rsa
fi
```

#### Install public SSH key on all servers (already exists in demo)
> We want to logon without password over SSH, use CyberArk(PAM) to keep keys secure*

> Run this command from Ansible host, it puts public key in authorized_keys in /home/[user]/.ssh
```sh
ssh-copy-id server1.mylocal
```

#### Test to logon to server1 without passwords (or username...)
> server1 is a ubuntu server with the same user as the Ansible host.
```sh
ssh server1
```

### [Demo 2](../demo2/) :mag:
Show how to run some Ansible commands directly from command prompt towards server1
