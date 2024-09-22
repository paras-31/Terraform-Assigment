resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project}-igw"
  }
}


resource "aws_eip" "nat_eip" {
    tags = {
    Name = "nat-eip"
  }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat
  }
  tags = {
    Name = "${var.project}-private-rt"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.project}-public-rt"
  }
}

# Route Table Association for Public Subnets
resource "aws_route_table_association" "public" {
  count = length(var.azs)
  subnet_id      = var.public_subnet[count.index]   # No .id needed here
  route_table_id = aws_route_table.public.id
}

# Route Table Association for Private Subnets
resource "aws_route_table_association" "private" {
  count = length(var.azs)
  subnet_id      = var.private_subnet[count.index]  # No .id needed here
  route_table_id = aws_route_table.private.id
}


# Optional: Transit Gateway
resource "aws_ec2_transit_gateway" "main" {
  count = var.enable_transit_gateway ? 1 : 0
  description = "Transit Gateway for ${var.project}"
  tags = {
    Name = "${var.project}-transit-gateway"
  }
}
