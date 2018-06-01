# Jenkins master container

## TODO

### Get jenkins master running with a declarative pipeline which provisions a docker slave.

* Docker slaves being provisioned on the jenkins master docker-machine
* Once Docker cloud host URI is working, update the DOCKER_HOST environment variable with it
* Move bitbucket ssh private key to jenkins master ~/.ssh/id_rsa
* Docker slaves on a different machines than the master

## Notes

[Binding the jenkins root directory as a volume is both recommended and discouraged](https://github.com/jenkinsci/docker/blob/master/README.md)

## Enabling Docker remote API on a host

[Follow these steps](https://www.ivankrizsan.se/2016/05/18/enabling-docker-remote-api-on-ubuntu-16-04/)

## Logs

To tail the logs:

```sh
docker exec jenkins-master tail -f /var/log/jenkins/jenkins.log
```

To fetch the logs:

```sh
docker cp jenkins-master:/var/log/jenkins/jenkins.log jenkins.log
```

## Plugins

[List of plugins](https://updates.jenkins.io/download/plugins/)

To add another plugin, pass it's name to `/usr/local/bin/install-plugins.sh` as another argument in the Dockerfile.

### Default plugins

To get installed plugins, run this in the Jenkins script console at <jenkins-url>/script:

```groovy
Jenkins.instance.pluginManager.plugins.each{
  plugin ->
    println ("(${plugin.getShortName()}): ${plugin.getVersion()}")
}
```

Or run this

```sh
curl -s -k "http://admin:admin@localhost:8080/pluginManager/api/json?depth=1" | jq -r '.plugins[].shortName' | tee plugins.txt

```

## Setting up the Docker plugin

### Create the 'Docker' cloud in Jenkins config

1. Browse to $(JENKINS_HOST)/configure
2. Add a new docker 'cloud'
3. Set the Docker Host URI to the 'tcp' output of `docker-machine config` on your docker host???


