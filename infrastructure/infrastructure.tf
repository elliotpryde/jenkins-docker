provider "aws" {
  alias               = "main"
  region              = "${var.aws_region}"
  profile             = "${var.aws_profile}"
  allowed_account_ids = ["${var.aws_account_id}"]
  version             = "1.19"
}

provider "google" {
  alias       = "main"
  credentials = "${file("google-cloud-credentials.json")}"
  project     = "${var.google_project_id}"
  region      = "europe-west2"
  version     = "1.15"
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
    aws    = "aws.main"
    google = "google.main"
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

variable "google_project_id" {
  type = "string"
}
