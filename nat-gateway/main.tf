resource "aws_nat_gateway" "this" {
  allocation_id = var.eip
  subnet_id     = var.subnet
  tags = {
    Name = "${var.project}-nat-gateway"
  }
}