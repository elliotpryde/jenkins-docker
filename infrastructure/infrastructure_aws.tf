provider "aws" {
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

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "elliot-ssh-key-pair" {
  key_name   = "elliot-ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCrjtoxj519T5i5eowcbIGHtrBHXcuJqib1yzm1yHmKfyA/Px9jZzVsgBq5QDIzsMtdXzp6GPliRoJ4NzoUkTaB92y7kIJXFqX3ZxvTKO/De90026RKCUdpuvz5tLEtoS9s3gaw5fQg548oQj0RvASGzreIggYvFJflcZBJQETW7I+bNbtnwO5YtHjOwFyRomVtdWdqyXegzpJKdpf4CWk9FXYokREN98LrhKe09LNAq9Kz+yneYQWN8WHTokIesLlPQ4NK85fjNA2+mOtnz42i2VZWd8wgvnrc89VOTpdd4ejt2/VYbDeaRpCTOlHCYXNWP+A2VwY4jFFRzdQ3fFF elliot_ssh"
}

# Find my latest available jenkins_master AMI
data "aws_ami" "jenkins_master" {
  owners = ["self"]

  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Component"
    values = ["jenkins_master"]
  }
}

resource "aws_instance" "jenkins_master_vm" {
  ami             = "${data.aws_ami.jenkins_master.id}"
  instance_type   = "t2.micro"
  security_groups = ["allow_all"]
  key_name        = "elliot_ssh"
}
