#!/bin/sh -x

sudo apt-get update
sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
sudo apt-get update
sudo apt-get install -y docker-ce=18.03.1~ce-0~ubuntu

sudo gpasswd -a $USER docker
newgrp docker
groups $USER | grep docker
_IS_IN_DOCKER_GROUP=$?

exit $_IS_IN_DOCKER_GROUP