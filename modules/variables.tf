# cidr-block and vpc

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

# vpc-id

variable "vpc_id" {
  description = "The name of the VPC"
  type        = string
}

# public subnets

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

# private subnet

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}

# public avaialability zone

variable "public_availability_zone" {
  description = "The availability zone for the public subnet"
  type        = string
}

# private availability zone

variable "private_availability_zone" {
  description = "The availability zone for the private subnet"
  type        = string
}

# public subnet name

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

# private subnet name

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

# internet gateway

variable "igw_name" {
  description = "The name of the internet gateway"
  type        = string
}

# NAT gateway

variable "nat_gw_name" {
  description = "The name of the NAT gateway"
  type        = string
}

# EIP
variable "eip_name" {
  description = "The name of the Elastic IP"
  type        = string
}

# public route table

variable "public_rt_name" {
  description = "The name of the public route table"
  type        = string
}

# private route table

variable "private_rt_name" {
  description = "The name of the private route table"
  type        = string
}

# public NACL

variable "public_nacl_name" {
  description = "The name of the public network ACL"
  type        = string
}

# private NACL

variable "private_nacl_name" {
  description = "The name of the private network ACL"
  type        = string
}
