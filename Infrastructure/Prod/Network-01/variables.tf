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


# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "VPC to host static web site"
}

# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}


