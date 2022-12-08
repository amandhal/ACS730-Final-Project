# Output variables for VPC
output "vpc_id" {
  value = aws_vpc.mainG5Vpc.id
}

# Output variables for Public Subnets
output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}
# Output variables for Public Cidr Block

output "public_cidr_blocks" {
  value = var.public_cidr_blocks
}

# Output variables for Private VPC
output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

# Output variables for Private CIDR block 
output "private_cidr_blocks" {
  value = var.private_cidr_blocks
}


# Output variables for Nat Gate Way
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}

# Output variables for Elastic IP
output "aws_eip" {
  value = aws_eip.nat_eip.id
}