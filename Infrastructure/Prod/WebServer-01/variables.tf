/*# Default tags
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
*/
# Instance type
variable "instance_type" {
  default     = "t3.medium"
  description = "Type of the instance"
  type        = string
}


# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Deployment Environment"
}



#Desired Capacity 
variable "desired_capacity" {
  default     = 3
  type        = number
  description = "Optimal Capacity"
}

#Minimum group size for auto scaling
variable "minimum_size" {
  default     = 1
  type        = number
  description = "Minimum group size for auto scaling"
}
#Maximum group size for auto scaling
variable "maximum_size" {
  default     = 4
  type        = number
  description = "Maximum group size for auto scaling"
}


