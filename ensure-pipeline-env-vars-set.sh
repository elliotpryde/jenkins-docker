#!/bin/bash -eux

if [[ -z "${JENKINS_ROOT}" ]]; then
  echo "JENKINS_ROOT environment variable must be set"
  exit 1
else
  echo "JENKINS_ROOT environment variable is set"
fi

if [[ -z "${DOCKER_HUB_PASSWORD}" ]]; then
  echo "DOCKER_HUB_PASSWORD environment variable must be set"
  exit 1
else
  echo "DOCKER_HUB_PASSWORD environment variable is set"
fi
