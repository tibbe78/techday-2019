# CheckPoint MGT API SDK
#
# VERSION               0.0.3

# Download base image from python repository version 3.7-alpine
# Alpine is extra small image
FROM python:3.7-alpine
MAINTAINER Christofer Tibbelin <christofer.tibbelin@cygate.se>

# update + install git
RUN apk add --update git

# Install CheckPoint MGT API to talk to CheckPoint MGT server
RUN pip install git+https://github.com/CheckPointSW/cp_mgmt_api_python_sdk

#Keep container running Fake as we use docker connection to reach it.
ENTRYPOINT ["tail", "-f", "/dev/null"]
