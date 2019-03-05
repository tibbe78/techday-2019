ansible-playbook -i inventory --ask-become-pass techday.yml


ansible-vault create sudo_passwd.yml
# write this in vault
ubuntu_servers_sudo_pass = cygate
ansible-playbook -i inventory --ask-vault-pass --extra-vars '@sudo_passwd.yml' techday.yml
