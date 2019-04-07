### Cygate Techdays 2019
Ansible automation demo for Cygate Techdays 2019 by Christofer Tibbelin
## websiteX role :blue_book::green_book::orange_book:
### a simple role that installes apache2 and installs a simple webpage
#### It uses both copy files and also templates to do this.
> The Role installes apache2 on ubuntu and copies one http.conf file from files. It also uses >templates to create a new file for index.html
> It will restart the service if there have been a change using the handlers
#### Files and folder structure
```sh
websiteX/
├── defaults
│   └── main.yml
├── files
│   └── apache2.conf
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   ├── configure.yml
│   ├── install.yml
│   ├── main.yml
│   └── service.yml
├── templates
│   └── index.html.j2
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml
```
#### Requirements
that the server is a ubuntu, as I don't check for the operating system. it will fail if not ubuntu.
That you are sudo user on the host.
#### Role Variables
example default varible uses for index.html
website_name = "Techday Web"
#### Dependencies
no dependencies
#### Example Playbook
Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```yml
- hosts: servers
  roles:
     - { role: websiteX }
```
#### License
MIT
#### Author Information
Christofer Tibbelin with help of Internet, Google and everyone else.
