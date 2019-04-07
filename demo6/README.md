### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## Ansible Demo 6 :blue_book::green_book::orange_book:
### How Ansible roles can simplify playbook complexity
#### Ansible Roles simplify playbooks by splitting up them in smaller parts and making them more modular
> [Ansible Galaxy](https://galaxy.ansible.com) is the public repository for roles
#### Lets get one public role from Ansible Galaxy and also one of our own roles.
> geerlingguy.firewall is a public role that installs the iptables firewall on the server.\
> we will install it localy for now using the requirements.yml file.\
> requirements.yml will download the firewall role but also our own websiteX role from GitHub.
```sh
ansible-galaxy -p ./roles install -r requirements.yml
```
#### Now we should have two roles in our roles catalog in det local folder.
> for more info on how we created the websiteX role have a look at it's [GitHub page.](https://github.com/tibbe78/websiteX)\
#### You can test your playbooks and roles with the syntax-check option
```sh
ansible-playbook -i inventory.ini site.yml --syntax-check
```
#### If it's ok you can then run it in a development environment.
> It's smart to create a snapshot of your virtual dmz webserver before you run this, as you can easily revert back for testing.
```sh
ansible-playbook -i inventory.ini site.yml
```
> Now check that the webserver is working and the index.html is correct.
### [Demo 7](../demo7/) :runner::books::grin:
Use RunDeck to bind it all together.
