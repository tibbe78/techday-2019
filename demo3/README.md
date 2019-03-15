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
- hosts: ubuntu*
  become: True
  gather_facts: True

  tasks:
    - name: Update all packages to the latest version
      apt:
        upgrade: dist
```

#### run the test module ping against only Servers group in this inventory.
```C
ansible -i inventory -m ping servers
```

#### View all information (*called 'facts'*) Ansible have gathered about these host.
```C
ansible -i inventory -m setup all
```

#### View only network information for hosts via subset
```C
ansible -i inventory -m setup -a 'gather_subset=!all,!any,network' servers
```

#### View only default network information for hosts via filter
```C
ansible -i inventory -m setup -a 'filter=ansible_default_ipv4' servers
```
