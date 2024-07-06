variable "security_group_rules" {
    type = set(string)
}
variable "load_balancer_name" {
    type = string
}
variable "load_balancer_type" {
    type = string
    default = "application"
}
variable "subnet_ids" {
    type = list(string)

}