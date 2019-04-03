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
ansible-galaxy init websiteX --offline
```
> "ansible-galaxy init" then creates a starting structure for a role.
> You can remove the stuff you don't need from this folder structure
```bash
websiteX
├── defaults #Default variables
│   └── main.yml #main.yml is the startfile in each folder
├── files #Files you need in your role that you don`t change.
│   └── index.html #I have added a index.html here for my website
├── handlers #Tasks that will only be run once. ex service restart
│   └── main.yml #Ansible always start reading main.yml in each folder
├── meta #Metadata about this role
│   └── main.yml #Ansible always start reading main.yml in each folder
├── README.md #Description of the role
├── tasks #All tasks you have for this role.
│   └── main.yml #Ansible always start reading main.yml in each folder
├── templates #Templates using jinja2 template language.
├── tests #If you have automatic testing in your role
└── vars #Variables that will override the defaults.
    └── main.yml #Ansible always start reading main.yml in each folder
```
#### My role websiteX should install and configure a server to be my public website for our DMZ
### [Demo 7](demo7/) :runner::books::grin:
Use RunDeck to bind it all together.
