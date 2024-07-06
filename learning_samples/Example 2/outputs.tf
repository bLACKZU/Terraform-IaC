output "public_url" {
  description = "Public URL of Ec2 Instance"
  value       = aws_instance.web.public_ip
}