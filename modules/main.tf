# vpc setup

resource "aws_vpc" "lms_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# public subnet

resource "aws_subnet" "lms_public_sn" {
  vpc_id     = aws_vpc.lms_vpc.id
  cidr_block = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.public_availability_zone

  tags = {
    Name = var.public_subnet_name
  }
}

# private subnet

resource "aws_subnet" "lms_private_sn" {
  vpc_id     = aws_vpc.lms_vpc.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = var.private_availability_zone

  tags = {
    Name = var.private_subnet_name
  }
}

# internet gateway

resource "aws_internet_gateway" "lms_igw" {
  vpc_id = aws_vpc.lms_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# NAT gateway

resource "aws_nat_gateway" "lms_nat_gw" {
  allocation_id = aws_eip.lms-eip.id
  subnet_id     = aws_subnet.lms_public_sn.id
  tags = {
    Name = var.nat_gw_name
  }
}

# Elastic ip
	
resource "aws_eip" "lms-eip" {
  tags = {
    Name = var.eip_name
  }
}

# public route table

resource "aws_route_table" "lms-public-rt" {
  vpc_id = aws_vpc.lms_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lms_igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# public route table association

resource "aws_route_table_association" "lms_public_sn_rt_association" {
  subnet_id      = aws_subnet.lms_public_sn.id
  route_table_id = aws_route_table.lms-public-rt.id
}

# private route table

resource "aws_route_table" "lms-private-rt" {
  vpc_id = aws_vpc.lms_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lms_nat_gw.id
  }
  tags = {
    Name = var.private_rt_name
  }
}
# private route table association

resource "aws_route_table_association" "lms_private_sn_rt_association" {
  subnet_id      = aws_subnet.lms_private_sn.id
  route_table_id = aws_route_table.lms-private-rt.id
}
# public subnet NACL

resource "aws_network_acl" "lms-public-nacl" {
  vpc_id = aws_vpc.lms_vpc.id
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }
  tags = {
    Name = var.public_nacl_name
  }
}
# private subnet NACL

resource "aws_network_acl" "lms-private-nacl" {
  vpc_id = aws_vpc.lms_vpc.id
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }
  tags = {
    Name = var.private_nacl_name
  }
}

# PUBLIC NACL ASSOCIATION

resource "aws_network_acl_association" "lms-public-nacl-association" {
  network_acl_id = aws_network_acl.lms-public-nacl.id
  subnet_id      = aws_subnet.lms_public_sn.id
}

# PRIVATE NACL ASSOCIATION

resource "aws_network_acl_association" "lms-private-nacl-association" {
  network_acl_id = aws_network_acl.lms-private-nacl.id
  subnet_id      = aws_subnet.lms_private_sn.id
}

