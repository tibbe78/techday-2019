# techday-2019
Automation demo for Cygate Techdays 2019
Ansible Demo

### [Techday-run.sh](https://github.com/tibbe78/techday-2019/blob/master/Techday-run.sh)
Techday runscript this is the file to follow when doing the demo.

### [techday.yml](https://github.com/tibbe78/techday-2019/blob/master/techday.yml)
The first playbook from Ansible and techdays.

#### Run the first command to run a playbook:
```C
ansible-playbook -i inventory --vault-password-file .vaultpass --extra-vars '@vaultfile.yml' techday.yml
```
