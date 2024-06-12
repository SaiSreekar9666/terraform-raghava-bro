# vpc details

output "vpc-id"{
  value = aws_vpc.lms-vpc.id
  description = "getting vpc id"
}

# pub subnet details

output "pub-subnet-id"{
  value = aws_subnet.lms-pub-sn.id
  description = "getting subnet id"
}

# pvt subnet details

output "pvt-subnet-id"{
  value = aws_subnet.lms-pvt-sn.id
  description = "getting subnet id"
}
