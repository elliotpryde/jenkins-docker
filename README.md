# TODO

 * Make the packer provisioners idempotent

# How to use

## Tools/Services used

| Tool/Service                                         | Description                                        |
| ---------------------------------------------------- | -------------------------------------------------- |
| [Amazon Web Services (AWS)](https://aws.amazon.com/) | cloud provider                                     |
| [Terraform](https://www.terraform.io/)               | infrastructure orchestration                       |
| [Packer](https://www.packer.io/)                     | building VM images                                 |
| [InSpec](https://www.inspec.io/)                     | infrastructure compliance/security test automation |

## Pre-requisites

* An AWS account
* An AWS S3 bucket which can be created through the AWS console GUI. This will be used to store the single source of truth for IaC managed state. This is the only
  time we will need to interact with the AWS console or touch infrastructure outside of code (apart from creating new private keys). When creating the S3 bucket
  via the wizard, enable versioning and read/write permissions for your $AWS_ACCESS_KEY_ID user. For more information, see the [official terraform s3 backend
  documentation](https://www.terraform.io/docs/backends/types/s3.html).

## Getting started

* Set the required environment variables defined in the section below
* build the required jenkins-master AMI by running `packer build jenkins_master_ami.json` from the `./infrastructure/images` directory
* `terraform init` from the `./infrastructure` directory
* `terraform apply` from the `./infrastructure` directory

## Environment variables

| Key                               | Description                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID (Required)      | Can be found on [AWS console security credentials page](https://console.aws.amazon.com/iam/home?#/security_credential) |
| AWS_SECRET_ACCESS_KEY (Required)  | Can be found on [AWS console security credentials page](https://console.aws.amazon.com/iam/home?#/security_credential) |
| JENKINS_USER (Optional)           | Override default admin username (admin)                                                                                |
| JENKINS_PASS (Optional)           | Override default admin password (admin)                                                                                |

# Overview

## Master

Runs as a single docker container.

## Nodes

[Jenkins Docker plugin documentation](https://wiki.jenkins.io/display/JENKINS/Docker+Plugin)

## Temporary steps to get this working

* Configure another host with the docker remote API configured for `tcp://0.0.0.0:2376` ([Instructions](https://www.ivankrizsan.se/2016/05/18/enabling-docker-remote-api-on-ubuntu-16-04))

* TODO: Provisioning containers across multiple hosts (swarm)
* TODO: Docker daemon API accessed using TLS

### Linux

__Pipeline provisioning ✔__

After installing the docker plugin, define a docker 'Cloud' which is an endpoint for the docker daemon API.

To test connectivity `docker -H remote.host:2375 info`

* Configure the docker plugin automatically and register the docker cloud in a [Jenkins post-initialization script](https://wiki.jenkins.io/display/JENKINS/Post-initialization+script)

### Windows

__Pipeline provisioning ?__

TODO

### OSX

__Pipeline provisioning ❌__

TODO

## Manual infra setup required before Terraform can do the rest

* ec2 instance to run terraform commands from
* ec2 instance ssh from single ip security group
* S3 backend provider
* DynamoDB state locking
