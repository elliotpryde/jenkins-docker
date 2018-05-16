# Overview

## Master

Runs as a single docker container.

#### TODO

* Working solution for persisting the jenkins_home directory
* Use docker image nodes from custom registry
* Run docker container nodes on VM other than master

## Environment variables

| Key                              | Description                                                                                                            |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID (Required)     | Can be found on [AWS console security credentials page](https://console.aws.amazon.com/iam/home?#/security_credential) |
| AWS_SECRET_ACCESS_KEY (Required) | Can be found on [AWS console security credentials page](https://console.aws.amazon.com/iam/home?#/security_credential) |

## Nodes

[Jenkins Docker plugin documentation](https://wiki.jenkins.io/display/JENKINS/Docker+Plugin)

### Linux

__Pipeline provisioning ✔__

After installing the docker plugin, define a docker 'Cloud' which is an endpoint for the docker engine API.

To test connectivity `docker -H remote.host:2375 info`

* [Add `"hosts": ["tcp://127.0.0.1:2375"]` to /c/programdata/docker/config/daemon.json?](http://simontimms.com/2016/07/20/windows_docker_daemon/)
* In docker GUI, check 'Expose daemon on tcp://localhost:2375 without TLS'?
* Configure the docker plugin automatically and register the docker cloud in a [Jenkins post-initialization script](https://wiki.jenkins.io/display/JENKINS/Post-initialization+script)

### Windows

__Pipeline provisioning ?__

TODO

### OSX

__Pipeline provisioning ❌__

TODO
