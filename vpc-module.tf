module "vpc" {
  source = "./modules"

  cidr_block                  = "10.0.0.0/16"
  vpc_name                    = "lms_vpc"
  vpc_id                      = "lms_vpc"
  public_subnet_cidr_block    = "10.0.1.0/24"
  private_subnet_cidr_block   = "10.0.2.0/24"
  public_availability_zone    = "us-east-1a"
  private_availability_zone   = "us-east-1b"
  public_subnet_name          = "lms_public_sn"
  private_subnet_name         = "lms_private_sn"
  igw_name                    = "lms_igw"
  eip_name                    = "lms_eip"
  nat_gw_name                 = "lms_nat_gw"
  public_rt_name              = "lms_public_rt"
  private_rt_name             = "lms_private_rt"
  public_nacl_name            = "lms_public_nacl"
  private_nacl_name           = "lms_private_nacl"
}

