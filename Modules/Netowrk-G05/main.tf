#----------------------------------------------------------
# ACS730 - Final Project - Terraform Automation
#
#
#----------------------------------------------------------

#  Define the provider
provider "aws" {
  region = "us-east-1"
}

#  Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

# Define tags locally
locals {
  default_tags = merge(module.globalvars.default_tags, { "env" = var.env })
  prefix       = module.globalvars.prefix
  name_prefix  = "${local.prefix}-${var.env}"
}

module "globalvars" {
  source = "/home/ec2-user/environment/FinalProject_Group5/Modules/globalvars"
}


# Create a new VPC 
resource "aws_vpc" "mainG5Vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-vpc"
    }
  )
  
}


# Add provisioning of the public subnetin the default VPC 
resource "aws_subnet" "public_subnet" {
  count             = length(var.public_cidr_blocks)
  vpc_id            = aws_vpc.mainG5Vpc.id
  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-public-subnet-${count.index}"
    }
  )
}

# Add provisioning of the private subnetin the default VPC 
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_cidr_blocks)
  vpc_id            = aws_vpc.mainG5Vpc.id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-private-subnet-${count.index}"
    }
  )
}

# Create  NAT Gatway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[1].id
# depends_on = [aws_internet_gateway.igw]
  tags = merge(
    local.default_tags, {
      Name = "${local.name_prefix}-nat_gw"
    }
  )


}

# Create elastic IP for NAT GW
resource "aws_eip" "nat_eip" {
  vpc   = true
  tags = {
    Name = "${local.name_prefix}-natgw"
  }
depends_on = [aws_internet_gateway.igw]
}

