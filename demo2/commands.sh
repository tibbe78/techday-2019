ansible -i inventory.ini -m setup -a 'gather_subset=!all,!any,network' servers
ansible -i inventory.ini -m ping all
ansible -i inventory.ini -m ping servers
ansible -i inventory.ini -m setup all
ansible -i inventory.ini -m setup -a 'filter=ansible_default_ipv4' servers
