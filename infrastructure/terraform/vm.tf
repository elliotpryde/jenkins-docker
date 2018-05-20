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
