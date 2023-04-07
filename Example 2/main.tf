resource "random_string" "random"{
    length = 20
}

resource "aws_instance" "web"{
    ami = var.ami
    instance_type = var.instance_type
    security_groups = [var.security_groups["security_group_1"]]
    subnet_id = var.subnet
}