# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 1 :dvd:

### Install Ansible

#### Add Ansibles official repository via PPA (Personal Package Archives).
```sh
sudo apt-add-repository ppa:ansible/ansible
```

#### update apt to get the latest package info.
```sh
sudo apt update
```

#### run apt to install Ansible.
```sh
sudo apt install ansible
```

#### Check that Ansible was installed with the latest version.
```sh
ansible --version
```
#### Generate ssh-keys on Ansible master (already exists in demo)
```sh
ssh-keygen
```

#### Install SSH keys on server 1 (already exists in demo)
##### *We want to logon without password over SSH, use CyberArk(PAM) to keep secure*
```sh
ssh-copy-id server1.mylocal
```


### [Demo 2](../demo2/) :mag:
Show how to run some commands directly from command prompt.
