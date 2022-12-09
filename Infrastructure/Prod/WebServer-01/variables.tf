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


#Private IP of Cloud 9 Environment these values need to hardcoded 
variable "my_private_ip" {
  default     = "172.31.45.63"
  type        = string
  description = "Private IP of Cloud 9 Environment"
}

#Public IP of Cloud 9 Environment these values need to hardcoded 
variable "my_public_ip" {
  default     = "34.226.222.38"
  type        = string
  description = "Public IP of Cloud 9 Environment"
}


variable "path_to_linux_key" {
  default     = "/home/ec2-user/.ssh/Group-No-5-prod.pub"
  description = "Path to the public key to use in Linux VMs provisioning"
  type        = string
}


