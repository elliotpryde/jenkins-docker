resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh connections on port 22"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_docker_api" {
  name        = "allow_docker_api"
  description = "Allow Docker API connections on port 2376"

  ingress {
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP connections on port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow HTTPS connections on port 443"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_outbound" {
  name        = "allow_all_outbound"
  description = "Allow all egress connections"

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
