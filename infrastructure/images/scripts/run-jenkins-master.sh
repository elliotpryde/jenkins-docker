#!/bin/sh -x

# DEPENDS ON
#   Tools:
#     docker
#     docker-compose

git clone https://elliotpryde@bitbucket.org/elliotpryde/jenkins-docker.git
cd jenkins-docker/master
# echo JENKINS_ROOT=$JENKINS_ROOT > network.env # epTODO
echo JENKINS_ROOT=http://localhost:8080 > network.env
sudo docker-compose up -d
