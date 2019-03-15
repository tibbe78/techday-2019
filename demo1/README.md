# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 1 :dvd:

### Install Ansible

#### Add Ansibles official repository via PPA (Personal Package Archives).
```Shell
sudo apt-add-repository ppa:ansible/ansible
```

#### update apt to get the latest package info.
```shell
sudo apt update
```

#### run apt to install Ansible.
```shell
sudo apt install ansible
```

#### Check that Ansible was installed with the latest version.
```shell
ansible --version
```
#### Generate ssh-keys on Ansible master (already exists in demo)
```shell
ssh-keygen
```

#### Install SSH keys on server 1 (already exists in demo)
##### *We want to logon without password over SSH, use CyberArk(PAM) to keep secure*
```shell
ssh-copy-id server1.mylocal
```


### [Demo 2 :mag:](../demo2/)
#### Next demo 2 will show how to run some commands directly from command prompt.
