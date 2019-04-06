# Create a random common password in your home folder.
openssl rand -base64 89 | head -c40 > ~/.vault-pass.common
# check that it looks ok
cat ~/.vault-pass.common
# edit ansible.cfg and add:
# [defaults]
# vault_identity_list = common@~/.vault-pass.common
sudo nano /etc/ansible/ansible.cfg
# edit the common vault (the file containing your secret passwords or varibles)
nano vault_common.yml
# Encrypt the vault_common.yml with the common password
ansible-vault encrypt --encrypt-vault-id common vault_common.yml
# Check that it's encrypted
cat vault_common.yml
# Run the playbook without need of sudo.
ansible-playbook -i inventory.ini upgrade_linux.yml
