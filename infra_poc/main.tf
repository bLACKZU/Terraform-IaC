module "vpc_module" {
  source = "./vpc"

  vpc_cidr             = var.vpc_cidr
  subnet_logical_name  = var.subnet_logical_name
  subnet_cidr          = var.subnet_cidr
  security_group_rules = var.security_group_rules
}

module "ec2_module" {
  source = "./ec2"
  instance_type        = var.instance_type
  subnet_id            = module.vpc_module.subnet_ids[var.subnet_logical_name]
  security_group_rules = module.vpc_module.security_group_rules
}

module "load_balancer" {
  source               = "./load_balancer"
  security_group_rules = module.vpc_module.security_group_rules
  load_balancer_name   = var.load_balancer_name
  load_balancer_type   = var.load_balancer_type
  subnet_ids = module.vpc_module.subnet_ids
}