variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
  type = map(string)
}
variable "subnet_logical_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "load_balancer_name" {
  type = string
}

variable "load_balancer_type" {
  type = string

}
variable "security_group_rules" {
  type = map(object({
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}
