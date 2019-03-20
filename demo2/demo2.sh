#!/bin/sh

# run module ping against all hosts in inventory
ansible -i inventory.ini -m ping all

# run module ping against group 'servers' in inventory
ansible -i inventory.ini -m ping servers

# run module setup against all servers in inventory
ansible -i inventory.ini -m setup all
ansible -i inventory.ini -m setup -a 'gather_subset=!all,!any,network' servers
ansible -i inventory.ini -m setup -a 'filter=ansible_default_ipv4' servers
