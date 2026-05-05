output "instance_ids" {
  description = "List of IDs of the created EC2 instances."
  value       = aws_instance.web[*].id
}

output "instance_public_ips" {
  description = "List of public IP addresses assigned to the EC2 instances."
  value       = aws_instance.web[*].public_ip
}

output "instance_public_dns" {
  description = "List of public DNS names of the EC2 instances."
  value       = aws_instance.web[*].public_dns
}

output "security_group_id" {
  description = "ID of the Security Group attached to the EC2 instances."
  value       = aws_security_group.web.id
}