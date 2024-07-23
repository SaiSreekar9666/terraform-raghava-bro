# vpc details

output "vpc-id"{
  value = module.vpc.vpc-id
  description = "getting vpc id"
}

# public subnet details

output "public-subnet-id"{
  value = module.vpc.public-subnet-id
  description = "getting subnet id"
}

# private subnet details

output "private-subnet-id"{
  value = module.vpc.private-subnet-id
  description = "getting subnet id"
}

# Internet gateway details

output "internet-gateway-id"{
  value = module.vpc.internet-gateway-id
  description = "getting igw id"
}

# NAT gateway details

output "nat-gateway-id"{
  value = module.vpc.nat-gateway-id
  description = "getting ngw id"
}

# Elastic ip details

output "eip-id"{
  value = module.vpc.eip-id
  description = "getting eip id"
}

# public route table details

output "public-rt-id"{
  value = module.vpc.public-rt-id
  description = "getting public route table id"
}

# private route table details

output "private-rt-id"{
  value = module.vpc.private-rt-id
  description = "getting private route table id"
}

# public nacl details

output "public-NACL-id"{
  value = module.vpc.public-NACL-id
  description = "getting public-nacl id"
 }

# private NACL details

output "private-NACL-id"{
  value = module.vpc.private-NACL-id
  description = "getting private-nacl id"
}
