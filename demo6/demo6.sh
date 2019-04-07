# Install the roles you need for your project, by using the requirements.yml
# Install to a local path or to global path if more than one is going to use it.
ansible-galaxy -p ./roles install -r requirements.yml

# Run the playbook with syntax-checking so it's correct
ansible-playbook -i inventory.ini site.yml --syntax-check

# Run the playbook for real..
ansible-playbook -i inventory.ini site.yml
