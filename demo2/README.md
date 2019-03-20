# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 2 :mag:

### Run simple modules directly from command prompt without any playbook.

#### Create a simple inventory file with two hosts. call it whatever you want.
> default name is hosts in /etc/ansible/

> These are DNS names in my case. Can be IP, SSH or Ansible names.
```INI
[servers]
server1
server2.mylocal
```

#### run the test module ping against all hosts in this inventory.
```sh
ansible -i inventory.ini -m ping all
```

#### run the test module ping against only servers group in this inventory.
```sh
ansible -i inventory.ini -m ping servers
```

#### View all information Ansible have gathered about these host.
>  This is called 'facts' in Ansible
```sh
ansible -i inventory.ini -m setup all
```

#### View only network facts for hosts via subset
```sh
ansible -i inventory.ini -m setup -a 'gather_subset=!all,!any,network' servers
```

#### View only default network facts for hosts via filter
```sh
ansible -i inventory.ini -m setup -a 'filter=ansible_default_ipv4' servers
```

### [Demo 3](../demo3/) :book:
Building our first playbook instead of console commands
