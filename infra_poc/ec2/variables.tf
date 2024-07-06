data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
variable "instance_type" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "security_group_rules" {
    type = set(string)
}
