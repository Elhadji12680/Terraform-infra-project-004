output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
output "public_subnet_az_1a_id" {
  value = aws_subnet.public_subnet_az_1a.id
}

output "private_subnet_az_1a_id" {
  value = aws_subnet.private_subnet_az_1a.id
}
output "private_subnet_az_1b_id" {
  value = aws_subnet.private_subnet_az_1a.id
}