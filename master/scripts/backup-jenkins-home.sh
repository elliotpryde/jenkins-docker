#!/bin/bash -eu

if [ -z "$1" ]
  then
    echo "ERROR: Missing argument, destination can not be empty."
    exit 1
fi

docker cp jenkins-master:/var/jenkins_home "$1"
