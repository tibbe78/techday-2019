#!/bin/sh

# so I don't stand in the wrong directory by accident.

cd /home/cygate/git/techday-2019/demo2

# run module ping against all hosts in inventory
ansible -i inventory.ini -m ping all

# run module ping against group 'servers' in inventory
ansible -i inventory.ini -m ping servers

# run module setup against all servers in inventory
ansible -i inventory.ini -m setup all
ansible -i inventory.ini -m setup -a 'gather_subset=!all,!any,network' servers
ansible -i inventory.ini -m setup -a 'filter=ansible_default_ipv4' servers
