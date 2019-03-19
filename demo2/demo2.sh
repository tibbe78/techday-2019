#!/bin/sh

# run module ping against all hosts in inventory
ansible -i inventory -m ping all

# run module ping against group 'servers' in inventory
ansible -i inventory -m ping servers

# run module setup against all servers in inventory
ansible -i inventory -m setup all
ansible -i inventory -m setup -a 'gather_subset=!all,!any,network' servers
ansible -i inventory -m setup -a 'filter=ansible_default_ipv4' servers
