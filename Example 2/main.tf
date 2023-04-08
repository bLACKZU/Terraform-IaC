
locals{
  team = "api_mgmnt_dev"
  application = "corp_api"
  server_name = "ec2-${var.environment}"
}
resource "random_string" "random"{
    length = 20
}

resource "aws_instance" "web"{
    ami = var.ami
    instance_type = var.instance_type
    security_groups = [var.security_groups["security_group_1"]]
    subnet_id = var.subnet

    tags = {
      Name = local.server_name
      Owner = local.team
      App = local.application
    }
} 

resource "aws_s3_bucket" "example" {
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
} 
