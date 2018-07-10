provider "aws" {
  alias               = "euw2"
  region              = "${var.aws_region}"
  profile             = "${var.aws_profile}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {
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

variable "aws_region" {
  type = "string"
}

variable "aws_profile" {
  type = "string"
}

variable "aws_account_id" {
  type = "string"
}
