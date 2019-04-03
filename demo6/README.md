### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin

## Ansible Demo 6 :blue_book::green_book::orange_book:

### How Ansible roles can simplify playbook complexity

#### Lets get one public role from ansible galaxy and also create one of our own.
> geerlingguy.firewall is a public role that installs the iptables firewall on the server.
```sh
ansible-galaxy -p ./ install geerlingguy.firewall
ansible-galaxy init websiteX --offline
```

> "ansible-galaxy init" then creates a starting structure for a role.

> You can remove the stuff you don't need from this folder structure
``` py
websiteX
├── defaults #Default variables
│   └── main.yml
├── files #Files you need in your role that you don`t change.
│   └── index.html #I have added a index.html here for my website
├── handlers #Tasks that will only be run once. ex service restart
│   └── main.yml
├── meta #Metadata about this role
│   └── main.yml
├── README.md #Description of the role
├── tasks #All tasks you have for this role.
│   └── main.yml
├── templates #Templates using jinja2 template language.
├── tests #If you have automatic testing in your role
│   ├── inventory
│   └── test.yml
└── vars #Variables that will override the defaults.
    └── main.yml
```


### [Demo 7](demo7/) :runner::books::grin:
Use RunDeck to bind it all together.
