provider "aws" {
  region = var.aws_region 
}

# Створення Security Group для доступу по SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_ubuntu_updated"
  description = "SSH"

  # comment
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # comment
  }

  # comment
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH-Access"
  }
}

# 
resource "aws_instance" "ubuntu_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  # key
  key_name      = var.key_name

  # ...
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Ubuntu-Junior-DevOps_updated"
  }
}
