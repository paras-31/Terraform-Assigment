output "aws_vpc" {
  value = aws_vpc.main.id
}

output "aws_eip" {
  value = aws_eip.nat_eip.id
}