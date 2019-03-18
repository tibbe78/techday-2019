# CheckPoint MGT API SDK
#
# VERSION               0.0.3

#Download base image Ubuntu 18.04
FROM ubuntu:18.04
MAINTAINER Christofer Tibbelin <christofer.tibbelin@cygate.se>

# Update Software repository
RUN apt-get update

# Install git & python-pip
RUN apt-get install -y git python-pip

# Install CheckPoint MGT API to talk to CheckPoint MGT server
RUN pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk

#Keep container running Fake as we use docker connection to reach it.
ENTRYPOINT ["tail", "-f", "/dev/null"]
