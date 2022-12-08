# Default tags
variable "default_tags" {
  default     = {}
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Name prefix Ref from Globalvars
variable "prefix" {
  type        = string
  description = "Default Prefix Name Final Project G5"
}

# Instance type
variable "instance_type" {

  description = "Type of the instance"
  type        = string
}


# Variable to signal the current environment 
variable "env" {

  type        = string
  description = "Deployment Environment"
}



#Maximum capacity for the Auto scaling group
variable "desired_capacity" {

  type        = number
  description = "Maximum capacity for the Auto scaling group"
}
