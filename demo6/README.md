### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## Ansible Demo 6 :blue_book::green_book::orange_book:
### How Ansible roles can simplify playbook complexity
#### Ansible Roles simplify playbooks by splitting up them in smaller parts and making them more modular
> [Ansible Galaxy](https://galaxy.ansible.com) is the public repository for roles
#### Lets get one public role from Ansible Galaxy and also create one of our own.
> geerlingguy.firewall is a public role that installs the iptables firewall on the server.
```sh
ansible-galaxy -p ./ install geerlingguy.firewall
```
> "ansible-galaxy init" creates a starting folder structure for a role.\
> I'm creating a role called websiteX and that it's my own with the --offline argument.
```sh
ansible-galaxy init websiteX --offline
```
> You can remove the stuff you don't need from this folder structure
```sh
websiteX
├── defaults #Default variables
│   └── main.yml #main.yml is the startfile in each folder
├── files #Files you need in your role that you don`t change.
├── handlers #Tasks that will only be run once. ex service restart
│   └── main.yml #Ansible always start reading main.yml in each folder
├── meta #Metadata about this role
│   └── main.yml #Ansible always start reading main.yml in each folder
├── README.md #Description of the role
├── tasks #All tasks you have for this role.
│   └── main.yml #Ansible always start reading main.yml in each folder
├── templates #Templates using jinja2 template language. Like files but can be modified
├── tests #If you have automatic testing in your role
└── vars #Variables that will override the defaults.
    └── main.yml #Ansible always start reading main.yml in each folder
```
#### My role websiteX should install and configure a server to be my public website for our DMZ
> Default location for roles is either /etc/ansible/roles or ~/.ansible/roles\
> But i have put the roles I use in the roles folder localy in demo6
#### Created a simple webpage and put it under templates as index.html.j2
> we use jinja2 to insert website name and servername from varibles.
```html
<!doctype html>
<html>
  <head>
    <title>{{ website_name | default("Unknown Site") }}</title>
  </head>
  <body>
    <p>It worked.. <strong>{{ website_name }}</strong> on server {{ ansible_facts['nodename'] }} Anssible roles <strong>Works</strong> and is fun</p>
  </body>
</html>
```
#### we also split up our tasks in four files to make it easier to read.
> main.yml i always called, it calls the other ones in order.
```sh
websiteX/tasks/
├── main.yml #always runs at start
├── install.yml #install apache2
├── configure.yml #configure apache2
└── service.yml #start apache2
```
#### we create a new handler in main.yml in folder handlers
> handlers will only run once, good for restarting services after changes.\
> It's the name of the handler that will be used for identifier.
```sh
- name: restart_apache_service
  service:
    name: apache2
    state: restarted
```
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
### [Demo 7](demo7/) :runner::books::grin:
Use RunDeck to bind it all together.
