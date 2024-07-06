vpc_cidr = "10.0.0.0/16"
subnet_cidr = {
  "0" = "10.0.1.0/24"
  "1" = "10.0.2.0/24"
}
subnet_logical_name = "0"
instance_type       = "t2.micro"

security_group_rules = {
  default = {

    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}
load_balancer_name = "testlb"
load_balancer_type = "application"