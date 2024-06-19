# vpc setup

resource "aws_vpc" "lms_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "lms-vpc"
  }
}

# public subnet

resource "aws_subnet" "lms_public_sn" {
  vpc_id     = aws_vpc.lms_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "lms-public_sn"
  }
}

# private subnet

resource "aws_subnet" "lms_private_sn" {
  vpc_id     = aws_vpc.lms_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "lms-private_sn"
  }
}

# internet gateway

resource "aws_internet_gateway" "lms_igw" {
  vpc_id = aws_vpc.lms_vpc.id

  tags = {
    Name = "lms-igw"
  }
}

# NAT gateway

resource "aws_nat_gateway" "lms_nat_gw" {
  allocation_id = aws_eip.lms-eip.id
  subnet_id     = aws_subnet.lms_public_sn.id
  tags = {
    Name = "lms-nat-gw"
  }
}

# Elastic ip

resource "aws_eip" "lms-eip" {
  tags = {
    Name = "lms-eip"
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
    Name = "lms-public-rt"
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
    Name = "lms-private-rt"
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
    Name = "lms-public-nacl"
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
    Name = "lms-private-nacl"
  }
}

# public NACL rule

resource "aws_network_acl_rule" "lms-public_allow_all" {
  network_acl_id = aws_network_acl.lms-public-nacl.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
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
