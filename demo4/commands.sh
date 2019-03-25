tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1 > .vault-pass.common
cat .vault-pass.common
sudo nano /etc/ansible/ansible.cfg
cat vault_common.yml
ansible-vault encrypt --encrypt-vault-id common vault_common.yml
cat vault_common.yml
ansible-playbook -i inventory.ini playbook.yml
