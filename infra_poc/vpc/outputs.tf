output "subnet_id" {
    value = aws_subnet.subnets[var.subnet_logical_name].id
}
output "security_group_rules" {
    value = toset([aws_security_group.inbound.id])
}
output "subnet_ids" {
    value = values(aws_subnet.subnets)[*].id
}