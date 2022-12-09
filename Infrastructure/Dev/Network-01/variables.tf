# Provision private subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.100.1.0/24", "10.100.2.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs"
}

# Provision public subnets in custom VPC
variable "public_subnet_cidrs" {
  default     = ["10.100.3.0/24", "10.100.4.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs"
}


# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "VPC to host static web site"
}

# Variable to signal the current environment 
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}

/*
# Default tags
variable "default_tags" {
  default = {
    "App"   = "Web-Application-TerraformAutomation"
    "Project" = "Final-Project-ACS730"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Name prefix
variable "prefix" {
  type        = string
 value     = "Group-No-5"
  description = "Name prefix"
}

*/