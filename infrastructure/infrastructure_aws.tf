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

resource "aws_key_pair" "ssh-key-pair" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNfVl+XOfCXd1qAs1ZAOIRUuofz8KURoYJJK3g7/YJ660WWxcCRS73PMlcPsjbPunIi/maKDpuv3U2/rzknZGfKcUYsAtnPm7LD70zEZknTZtb4vM2+xtV5QLoFvB9MLoZr66WlJr5a4VQlyOa39mA5eo0RuaBtRAnCZrnA87AGGNv1CbCq5lhFO9QrFP++1Rd6Eqh+4XoIr1HL6N2BUA4QNKM2/hDgjtH+4gCOdeF1PJYvWf921mvsQfHGWLuD1Ldnb/xYKc/657Cg3z3lZKfmyCBwJ74QMamfoEwjJdtNa15/5VwLYqTnx904hnKZW2DpmuqjsQ8Y06P1HJlP9UP"
}

resource "aws_instance" "example_ubuntu_ec2_t2_nano" {
  ami             = "ami-f4f21593"
  instance_type   = "t2.nano"
  security_groups = ["allow_all"]
  key_name        = "ssh-key"
}
