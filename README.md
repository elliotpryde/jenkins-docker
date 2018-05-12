# Overview

## Master

Runs as a single docker container.

#### TODO

* Working solution for persisting the jenkins_home directory
* [Install plugins automatically](https://stackoverflow.com/questions/47185493/setup-docker-jenkins-with-default-plugins)

## Nodes

[Jenkins Docker plugin documentation](https://wiki.jenkins.io/display/JENKINS/Docker+Plugin)

### Linux

__Pipeline provisioning ✔__

After installing the docker plugin, define a docker 'Cloud' which is an endpoint for the docker engine API.

To test connectivity `docker -H remote.host:2375 info`

* [Add `"hosts": ["tcp://127.0.0.1:2375"]` to /c/programdata/docker/config/daemon.json?](http://simontimms.com/2016/07/20/windows_docker_daemon/)
* In docker GUI, check 'Expose daemon on tcp://localhost:2375 without TLS'?
* Configure the docker plugin automatically and register the docker cloud in a [Jenkins post-initialization script](https://wiki.jenkins.io/display/JENKINS/Post-initialization+script)

#### TODO

* Insecure docker cloud working on jenkins master
* Docker template working in a pipeline

### Windows

__Pipeline provisioning ?__

TODO

### OSX

__Pipeline provisioning ❌__

TODO
