# Output variables for Public Subnets
output "public_subnet_ids" {
  value = module.staging-networing.public_subnet_ids
}

# Output variables for VPC 
output "vpc_id" {
  value = module.staging-networing.vpc_id
}
# Output variables for Private VPC
output "private_subnet_ids" {
  value = module.staging-networing.private_subnet_ids
}


# Output variables for Internet Gateway
output "aws_internet_gateway" {
  value = module.staging-networing.aws_internet_gateway
}
