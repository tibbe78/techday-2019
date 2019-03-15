#!/bin/sh

# run module ping

ansible -i inventory -m ping all
ansible -i inventory -m ping servers

# run module setup
ansible -i inventory -m setup all
ansible -i inventory -m setup -a 'gather_subset=!all,!any,network' servers
ansible -i inventory -m setup -a 'filter=ansible_default_ipv4' servers
