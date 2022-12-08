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