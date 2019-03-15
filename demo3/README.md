# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 3 :book:

### Building our first playbook instead of console commands and run this playbook

#### use a simple inventory file with two hosts.
```C
[ubuntu]
server1.mylocal
server1.mylocal
```

#### write a simple playbook in YAML to update servers with apt module
```C
---
- hosts: ubuntu
  become: true
  gather_facts: true

  tasks:
    - name: Only run update cache if the last one is more than 3600 seconds ago
      apt:
        update_cache: yes
        cache_valid_time: 3600

    - name: Update all packages to the latest version
      apt:
        upgrade: dist
```

#### run the playbook to update servers
```C
ansible-playbook -i inventory --ask-become-pass playbook.yml
```

#### login to server1 to verify that it's upgraded
```C
ssh server1.mylocal
sudo apt upgrade
```
