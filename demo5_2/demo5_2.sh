#!/bin/sh

# clone the module from git
git clone https://github.com/CheckPointSW/cpAnsible

# copy the actual ansible module catalog to the default ansible custom modules place.
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules

# Check the container is running still
docker ps

# Run the playbook to check if it would have worked to add objects to firewall
ansible-playbook --check -i inventory.ini add_fw_obj.yml

# Run the playbook to add objects to firewall
ansible-playbook -i inventory.ini add_fw_obj.yml

# Run the playbook to remove the objects to firewall
ansible-playbook -i inventory.ini del_fw_obj.yml
