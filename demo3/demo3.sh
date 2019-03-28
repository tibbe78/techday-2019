# Run the playbook but ask for the sudo password
ansible-playbook -i inventory.ini --ask-become-pass playbook.yml

# ssh to one of the servers and check that it's patched now.
ssh server1.mylocal
sudo apt upgrade
