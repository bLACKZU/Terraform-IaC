
locals {
  team        = "api_mgmnt_dev"
  application = "corp_api"
  server_name = "ec2-${var.environment}"
}

data "aws_ec2_instance_type" "type" {
  instance_type = "t2.micro"
}


/* resource "random_string" "random"{
    length = 20
} */

resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [var.security_groups["security_group_1"]]
  subnet_id       = var.subnet

  tags = {
    Name    = local.server_name
    Owner   = local.team
    App     = local.application
    premise = data.aws_ec2_instance_type.type.bare_metal

  }
}


/* resource "aws_s3_bucket" "example" {
  bucket = var.bucket
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_security_group" "web-server-sg" {
  name        = "web_server_inbound"
  description = "Allow TLS inbound traffic on 443"
  

  ingress {
    description      = "TLS from internet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
}  */

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "MyAWSKey.pem"
}

resource "aws_key_pair" "generated" {
  key_name   = "MyAWSKey"
  public_key = tls_private_key.generated.public_key_openssh
  lifecycle {
    ignore_changes = [key_name]
  }
}

