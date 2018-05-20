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
