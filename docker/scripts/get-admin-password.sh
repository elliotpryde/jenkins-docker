#!/bin/bash -eu

password=$(docker exec jenkins-master cat //var/jenkins_home/secrets/initialAdminPassword)

echo $password
