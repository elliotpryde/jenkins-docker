provider "aws" {
  alias  = "euw2"
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "jenkins-docker-terraform"
    key    = "jenkins-docker-terraform.tfstate"
    region = "eu-west-2"                        # backend values cannot be interpolated :(
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "jenkins-docker-terraform"
    key    = "jenkins-docker-terraform.tfstate"
    region = "eu-west-2"                        # backend values cannot be interpolated :(
  }
}

module "jenkins-master" {
  source = "./terraform"

  providers = {
    aws = "aws.euw2"
  }
}
