data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "testvpc1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

}

resource "aws_subnet" "subnets" {
  for_each = var.subnet_cidr
  vpc_id     = aws_vpc.testvpc1.id
  cidr_block = each.value
  # availability_zone = data.aws_availability_zones.available.names[0]
  availability_zone = element(data.aws_availability_zones.available.names, each.key)
  map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.testvpc1.id
}


resource "aws_route_table" "SubnetRT" {
  vpc_id = aws_vpc.testvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "SubnetRTAssoc" {
  for_each = aws_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.SubnetRT.id
}

resource "aws_security_group" "inbound" {
  name = "allow ssh and http"
  vpc_id = aws_vpc.testvpc1.id
  
  dynamic "ingress" {
    for_each = var.security_group_rules["default"].ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
    
  }

}

