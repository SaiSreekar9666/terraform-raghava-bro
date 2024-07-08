resource "aws_vpc" "lms-vpc" {
  cidr_block       = var.cidr-range
  instance_tenancy = "default"

  tags = {
    Name = "lms-vpc"
  }
}

