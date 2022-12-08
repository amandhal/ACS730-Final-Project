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
