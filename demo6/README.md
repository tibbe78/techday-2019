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

> It then creates a starting structure for a role.

> You can remove the stuff you don't need
``` html
./websiteX
├── defaults
│   └── main.yml
├── files
│   └── index.html
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   └── main.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```


### [Demo 7](demo7/) :runner::books::grin:
Use RunDeck to bind it all together.
