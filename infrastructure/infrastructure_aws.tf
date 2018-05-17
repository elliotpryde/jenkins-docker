provider "aws" {
  region = "eu-west-2"
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0J377Qc4rDiOPGGu73WBHg6IGBPmyOs+/CiZf20681EzEjC21bkJBDPSMa3ur/fQr+r22tZz8OSIjUyTvjAiFynQRTEzkXbPyTWlzu9abNoCIVTXkmDlO/+zLOcNJi3oW+5L679144ww2mOLxBtaWqZQR7/sLOtE7atqtk5MwokcqCuqgoceI89d715mD8ZMqsdhIbAApyCvQExwOWPeVfxYSIGBnY6ULEL1d1e8pkGSTg/qUz1jcBwYX90xJNa/6DQ859u/ERE/mKSXUECJugp+X+i6qi8HBi5UXLJX3Hz5tIOtQIDIRoDrQsWWgJhahPTqqb04XHpXFHqX29Ayn elliot_ssh"
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
