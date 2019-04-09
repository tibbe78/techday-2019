#!/bin/sh

# Rundeck works like ansible using SSH and also using ansible localy
# So it have to be installed on the same machine as ansible.
# There is a ansible plugin for rundeck that makes it easy to work with ansible.

mkdir downloads

# Get the latest Ansible plugin for rundeck
wget -P ./downloads https://github.com/Batix/rundeck-ansible-plugin/releases/download/3.0.1/ansible-plugin-3.0.1.jar
# Get the latest rundeck version
wget -P ./downloads https://dl.bintray.com/rundeck/rundeck-deb/rundeck_3.0.20.20190408-1.201904081511_all.deb


# Install Java
sudo apt install default-jre

# Check java version
java -version
