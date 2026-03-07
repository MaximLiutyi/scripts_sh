output "instance_public_ip" {
  value       = aws_instance.ubuntu_server.public_ip
  description = "Public IP address of the EC2 instance"
}

output "instance_id" {
  value       = aws_instance.ubuntu_server.id
  description = "ID of the EC2 instance"
}

output "selected_ami_id" {
  value = data.aws_ami.ubuntu.id
  description = "The ID of the AMI selected by the data source"
}
