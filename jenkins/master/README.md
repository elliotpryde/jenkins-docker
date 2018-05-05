# Jenkins master container

## TODO

### Get jenkins master running with a declarative pipeline which provisions a docker slave.

* Once Docker cloud host URI is working, update the DOCKER_HOST environment variable with it
* Move bitbucket ssh private key to jenkins master ~/.ssh/id_rsa
* Docker slaves on a different machines than the master

## Notes

[Binding the jenkins root directory as a volume is both recommended and discouraged](https://github.com/jenkinsci/docker/blob/master/README.md)

## Backups

Run the command below to backup the entire jenkins home directory.

```sh
docker cp $ID:/var/jenkins_home destination_dir
```

## Plugins

[List of plugins](https://updates.jenkins.io/download/plugins/)

To add another plugin, pass it's name to `/usr/local/bin/install-plugins.sh` as another argument in the Dockerfile.

### Default plugins

folders?
build timeout?
credentials binding plugin?
timestamper?
workspace cleanup?
gradle?
pipeline
github branch source?
pipeline: github groovy libraries
pipeline: stage view
github
ssh slaves plugin???
matrix authorization strategy?
email extension?
mailer?