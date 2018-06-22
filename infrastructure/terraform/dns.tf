# resource "aws_eip" "jenkins_master_eip" {
#   instance = "${aws_instance.jenkins_master_vm.id}"
# }

resource "aws_eip" "linux_docker_slave_host_eip" {
  instance = "${aws_instance.linux_docker_slave_host.id}"
}

resource "aws_route53_zone" "elliotpryde" {
  name = "elliotpryde.com"
}

# resource "aws_route53_record" "www" {
#   zone_id = "${aws_route53_zone.elliotpryde.zone_id}"
#   name    = "jenkins.elliotpryde.com"
#   type    = "A"
#   ttl     = "300"
#   records = ["${aws_eip.jenkins_master_eip.public_ip}"]
# }

