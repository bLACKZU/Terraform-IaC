resource "aws_lb" "test" {
  name               = var.load_balancer_name
  load_balancer_type = var.load_balancer_type
  security_groups    =  var.security_group_rules 
#   subnets            = [for subnet in aws_subnet.subnets : subnet.id]
  subnets = var.subnet_ids  
}