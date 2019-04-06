### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## Ansible Demo 4 :lock:
### Secure our sudo password from demo 3 and automate this
:exclamation: *using the same inventory file from demo 3*\
:exclamation: *using the same simple playbook from demo 3 as a base*
#### Create your secure vault-passwords in your home-folder or somewhere safe.
> This example uses openssl to generate a 40 characters long password.\
> _This Vault-Password should be secured with a PAM system such as CyberArk_
```sh
openssl rand -base64 89 | head -c40 > ~/.vault-pass.common
cat ~/.vault-pass.common
```
#### edit the ansible.cfg to point to these new vault passwords
```sh
sudo nano /etc/ansible/ansible.cfg
```
#####   Add this vault-id reference in the [defaults] section in ansible.cfg
```INI
[defaults]
vault_identity_list = common@~/.vault-pass.common
```
#### Create a file to store your secure variables, passwords, etc in.
```sh
nano vault_common.yml
```
> Add your secret variables or passwords
```YAML
---
sudo_password: cygate
other_secure_varible: SuperSecretVarible
```
#### Encrypt your vault_common.yml file so it's secure with the common vault password
```sh
ansible-vault encrypt --encrypt-vault-id common vault_common.yml
```
#### Add the vault file and the vault varible for the sudo in the playbook.
> This can also be done in the inventory
```YAML
gather_facts: true
vars_files:
  - vault_common.yml
vars:
  ansible_become_pass: "{{ sudo_password }}"

tasks:
```
#### run the playbook to update servers as root via sudo with the encrypted password
> Now we don't need to provide the sudo password and it's collected automatically.
```sh
ansible-playbook -i inventory.ini upgrade_linux.yml
```
### [Demo 5.1](../demo5_1/) :whale::ballot_box_with_check::point_up:
Build a [Docker](https://www.docker.com/) container and install Check Points API software in it.
