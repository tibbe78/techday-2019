#!/bin/sh

# Rundeck works like ansible using SSH and also using ansible localy
# So it have to be installed on the same machine as ansible.
# There is a ansible plugin for rundeck that makes it easy to work with ansible.

mkdir downloads

# Get the latest Ansible plugin for rundeck
wget -P ./downloads https://github.com/Batix/rundeck-ansible-plugin/releases/download/3.0.1/ansible-plugin-3.0.1.jar

# Install Java (Must be Java 8 not 11)
sudo apt install openjdk-8-jre-headless

# Check java version
java -version

# Install rundeck via APT
echo "deb https://rundeck.bintray.com/rundeck-deb /" | sudo tee -a /etc/apt/sources.list.d/rundeck.list
curl 'https://bintray.com/user/downloadSubjectPublicKey?username=bintray' | sudo apt-key add -
sudo apt-get update
sudo apt-get install rundeck

# Download the rundeck ansible plugin and put it in the default pluginfolder.
wget -P /var/lib/rundeck/libext https://github.com/Batix/rundeck-ansible-plugin/releases/download/3.0.1/ansible-plugin-3.0.1.jar

#change owner of plugin. might not be needed.
sudo chown rundeck:rundeck /var/lib/rundeck/libext/ansible-plugin-3.0.1.jar

#remove old ansible plugin included in release
sudo rm /var/lib/rundeck/libext/rundeck-ansible*

# Probably need to fix folder rights for ansible to write to the rundeck catalog.
sudo chown rundeck:rundeck /var/lib/rundeck

# Add your user to rundeck group if you want to share your files with rundeck.
sudo usermod -a -G rundeck cygate
# Or the opposite
sudo usermod -a -G cygate rundeck

#Test that ansible works
sudo su rundeck -s /bin/bash -c "ansible all -m ping"

sudo systemctl enable rundeckd
sudo systemctl restart rundeckd

go to: http://localhost:4440
login with admin:admin
