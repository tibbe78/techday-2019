#!/bin/sh

# Check the container is running still
docker ps

# clone the module from git
git clone https://github.com/CheckPointSW/cpAnsible

# copy the actual ansible module catalog to the default ansible custom modules place.
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules

# Run the playbook to add object to firewall
ansible-playbook -i inventory.ini add_fw_obj.yml
