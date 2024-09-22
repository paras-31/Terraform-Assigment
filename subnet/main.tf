# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.azs)
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-public-subnet-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count = length(var.azs)
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, length(var.azs) + count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.project}-private-subnet-${count.index + 1}"
  }
}