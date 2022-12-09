
# Output variables for Public Subnets
output "public_subnet_ids" {
  value = module.prod-networing.public_subnet_ids
}

# Output variables for VPC 
output "vpc_id" {
  value = module.prod-networing.vpc_id
}
# Output variables for Private VPC
output "private_subnet_ids" {
  value = module.prod-networing.private_subnet_ids
}


# Output variables for Internet Gateway
output "aws_internet_gateway" {
  value = module.prod-networing.aws_internet_gateway
}

# Output variables for Elastic IP

output "aws_eip" {
  value = module.prod-networing.aws_eip
}

