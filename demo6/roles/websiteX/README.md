websiteX
=========

The Role installes apache2 on ubuntu and copies one http.conf file from files. It also uses templates to create a new file for index.html
It the restart the service if there have been a change using the handlers

Requirements
------------

that the server is a ubuntu, as I don't check for the operating system. it will fail if not ubuntu.
That you are sudo user on the host.

Role Variables
--------------

example default varible uses for index.html
website_name = "Techday Web"

Dependencies
------------

no dependencies

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: websiteX }

License
-------

MIT

Author Information
------------------

Christofer Tibbelin with help of Internet, Google and everyone else.
