provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example_ubuntu_ec2_t2_nano" {
  ami           = "ami-f4f21593"
  instance_type = "t2.nano"
}
