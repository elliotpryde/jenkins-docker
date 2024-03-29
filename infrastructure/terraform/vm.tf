# data "aws_ami" "jenkins_master" {
#   owners = ["self"]

#   most_recent = true

#   filter {
#     name   = "state"
#     values = ["available"]
#   }

#   filter {
#     name   = "tag:Component"
#     values = ["jenkins_master"]
#   }
# }

# resource "aws_instance" "jenkins_master_vm" {
#   ami             = "${data.aws_ami.jenkins_master.id}"
#   instance_type   = "t2.micro"
#   security_groups = ["allow_http", "allow_ssh"]
#   key_name        = "elliot_ssh"
# }

data "aws_ami" "linux_docker_slave_host" {
  owners = ["self"]

  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Component"
    values = ["linux_docker_slave_host"]
  }
}

resource "aws_instance" "linux_docker_slave_host" {
  ami             = "${data.aws_ami.linux_docker_slave_host.id}"
  instance_type   = "t2.micro"
  security_groups = ["allow_ssh", "allow_docker_api", "allow_all_outbound"]
  key_name        = "elliot_ssh"
}
