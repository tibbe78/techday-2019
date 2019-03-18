# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 3 :book:

### Building our first playbook instead of console commands and run this playbook

#### add some more server to the inventory and put them in groups
> The [linux] group point to the other two groups
```INI
[server_internal]
server1
server2

[ubuntu_dmz]
dmz1
dmz2

[linux:children]
server_internal
ubuntu_dmz
```

#### write a simple playbook in YAML to update and upgrade servers with apt module
```YAML
---
- hosts: linux
  become: true #run as sudo
  gather_facts: true

  tasks:
    - name: Only run update cache if the last one is more than 3600 seconds ago
      apt:
        update_cache: yes
        cache_valid_time: 3600

    - name: Update all packages to the latest version if OS is Debian based
      apt:
        upgrade: dist
      when: ansible_facts['os_family'] == "Debian"
```

#### run the playbook to update servers as root via sudo
```sh
ansible-playbook -i inventory --ask-become-pass playbook.yml
```

#### login to server1 to verify that it's upgraded
```sh
ssh server1.mylocal
sudo apt upgrade
```

### [Demo 4](../demo4/) :lock:
Secure our sudo password with Ansible Vault
