# Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 4 :lock:

### Secure our sudo password from demo 3 and automate this

#### *using the same simple inventory file with two hosts from demo 3*

#### *using the same simple playbook file with update apt from demo 3*

#### Create your secure vault-passwords in your home-folder or somewhere safe.
*These Vault-Passwords should be secured with a PAM system such as CyberArk*
```sh
tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1 > ~/.vault-pass.common
tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1 > ~/.vault-pass.production
tr -cd '[:alnum:]' < /dev/urandom | fold -w32 | head -n1 > ~/.vault-pass.staging
cat ~/.vault-pass.production
```

#### edit the ansible.cfg to point to these new vault passwords
```sh
sudo nano /etc/ansible/ansible.cfg
```
#####   Add this vault-id reference in the [defaults] section in ansible.cfg
```INI
[defaults]
vault_identity_list = common@~/.vault-pass.common, staging@~/.vault-pass.staging, production@~/.vault-pass.production
```

#### Create a file to store your secure variables, passwords, etc in.
```sh
nano vault_prod.yml
```
##### Add your secret variables or passwords
```YAML
---
prod_sudo_password:  cygate
other_secure_varible: SuperSecretVarible
```

#### Encrypt your production vault so it's secure.
```sh
ansible-vault encrypt --encrypt-vault-id production vault_prod.yml
```

#### look at the now encrypted vault file.
*You can also edit the encrypted file with 'ansible-vault edit'*
```sh
cat vault_prod.yml
```


#### run the playbook to update servers as root via sudo
```sh
ansible-playbook -i inventory --ask-become-pass playbook.yml
```

#### run the playbook to update servers as root via sudo
```sh
ansible-playbook -i inventory --ask-become-pass playbook.yml
```

#### login to server1 to verify that it's upgraded
```sh
ssh server1.mylocal
sudo apt upgrade
```

### [Demo 4 :lock:](../demo4/)
Next Demo 4 (Secure our sudo password with Ansible Vault)
