# vpc details

output "vpc-id"{
  value = aws_vpc.lms_vpc.id
  description = "getting vpc id"
}

# public subnet details

output "public-subnet-id"{
  value = aws_subnet.lms_public_sn.id
  description = "getting subnet id"
}

# private subnet details

output "private-subnet-id"{
  value = aws_subnet.lms_private_sn.id
  description = "getting subnet id"
}

# Internet gateway details

output "internet-gateway-id"{
  value = aws_internet_gateway.lms_igw.id
  description = "getting igw id"
}

# NAT gateway details

output "nat-gateway-id"{
  value = aws_nat_gateway.lms_nat_gw.id
  description = "getting ngw id"
}

# Elastic ip details

output "eip-id"{
  value = aws_eip.lms-eip.id
  description = "getting eip id"
}

# public route table details

output "public-rt-id"{
  value = aws_route_table.lms-public-rt.id
  description = "getting public-rt id"
}

# private route table details

output "private-rt-id"{
  value = aws_route_table.lms-private-rt.id
  description = "getting private-rt id"
}

# public NACL details

output "public-NACL-id"{
  value = aws_network_acl.lms-public-nacl.id
  description = "getting public-NACL id"
}

# private NACL details

output "private-NACL-id"{
  value = aws_network_acl.lms-private-nacl.id
  description = "getting private-nacl id"
}
