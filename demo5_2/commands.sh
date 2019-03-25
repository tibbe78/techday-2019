docker ps
git clone https://github.com/CheckPointSW/cpAnsible
cp -r ./cpAnsible/check_point_mgmt /usr/share/my_modules
ansible-playbook -i inventory.ini playbook.yml
