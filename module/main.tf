module "vpc" {
  source = "../Vpc"
  vpc_cidr = var.vpc_cidr
  project = var.project
  azs = var.azs
  public_subnet = module.subnet.aws_subnet_public
  private_subnet = module.subnet.aws_subnet_private
  nat = module.nat.aws_nat_gateway
  enable_transit_gateway = var.enable_transit_gateway
}

module "subnet" {
  source = "../subnet"
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.aws_vpc
  azs = var.azs
  project = var.project
}

module "nat" {
  source = "../nat-gateway"
  project = var.project
  eip = module.vpc.aws_eip
  subnet = module.subnet.aws_subnet_public[0]
}