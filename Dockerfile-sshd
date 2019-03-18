# sshd + CheckPoint MGT API
#
# VERSION               0.0.2

#Download base image ubuntu 16.04
FROM ubuntu:18.04
MAINTAINER Christofer Tibbelin <christofer.tibbelin@cygate.se>

# Update Software repository
RUN apt-get update

# Install openssh
RUN apt-get install -y openssh-server git python-pip
RUN mkdir /var/run/sshd

# Install Python-pip and CheckPoint MGT API for Ansible to use.
RUN pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk

# Add user cygate in group cygate
RUN groupadd -r -f cygate -g 1000 && useradd -rm -d /home/cygate -s /bin/bash -g cygate -G sudo -u 1000 cygate

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22
