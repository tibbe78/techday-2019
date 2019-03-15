# techday-2019 Demo 2
Automation demo for Cygate Techdays 2019

## Ansible Demo 2

### Run first simple module ping directly from command prompt without any playbook.

#### Create a simple inventory file with two hosts.
```C
[servers]
server1.mylocal
server1.mylocal
```

#### run the test module ping against all hosts in this inventory.
```C
ansible -i inventory -m ping all
```

#### run the test module ping against only Servers group in this inventory.
```C
ansible -i inventory -m ping servers
```

#### View all information Ansible have gathered about these host. *Also called 'facts' in Ansible*
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
