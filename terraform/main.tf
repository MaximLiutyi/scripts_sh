provider "aws" {
  region = var.aws_region 
}

# 1. НОВИЙ БЛОК: Автоматичний пошук останньої версії Ubuntu 24.04
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Створення Security Group для доступу по SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_ubuntu_updated"
  description = "SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

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

# Оновлений ресурс EC2
resource "aws_instance" "ubuntu_server" {
  # ЗМІНЕНО: замість var.ami_id тепер використовуємо результат пошуку
  ami           = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type
  
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Ubuntu-Junior-DevOps_updated"
  }
}
