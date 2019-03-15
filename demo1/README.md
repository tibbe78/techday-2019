# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 1 :dvd:

### Install Ansible

#### Add Ansibles official repository via PPA (Personal Package Archives).
```C
sudo apt-add-repository ppa:ansible/ansible
```

#### update apt to get the latest package info.
```C
sudo apt update
```

#### run apt to install Ansible.
```C
sudo apt install ansible
```

#### Check that Ansible was installed with the latest version.
```C
ansible --version
```
#### Generate ssh-keys on Ansible master (already exists in demo)
```C
ssh-keygen
```

#### Install SSH keys on server 1 (already exists in demo)
##### *We want to logon without username or password over SSH user CyberArk to keep secret*
```C
ssh-copy-id server1.mylocal
```

### Next demo 2 will show how to run some commands directly from command prompt.
