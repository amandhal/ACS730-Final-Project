#  Define the provider
provider "aws" {
  region = "us-east-1"
}

# Data source for AMI id
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#Calling Remote States on the Basis on Environments

data "terraform_remote_state" "network" { // This is to use Outputs from Remote State
  backend = "s3"
  config = {
    bucket = "${var.env}-group05-finalproject"  // Bucket from where to GET Terraform State
    key    = "${var.env}-Network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                            // Region where bucket created
  }
}


# Data source for availability zones in us-east-1
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
  source = "../globalvars"
}

# Provision SSH key pair for Ubuntu and AmazonLinux VMs  2
resource "aws_key_pair" "linux_key" {
  key_name   = "linux_key-${var.env}"
  public_key = file(var.path_to_linux_key)
  tags = merge({
    Name = "${local.name_prefix}"
    },
    local.default_tags
  )
}

# Security Group for Bastion 
resource "aws_security_group" "SG_Bastion" {
  name        = "Allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id


  ingress {
    description = "SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}/32", "${var.my_private_ip}/32"]
    
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-SG_Bastion"
    }
  )
}

# Creating Bastion Server --1
resource "aws_instance" "Bastion_Server" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.linux_key.key_name
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  security_groups             = [aws_security_group.SG_Bastion.id]
  associate_public_ip_address = true  #3 Changed its value yto true after verfi.

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(local.default_tags,
    {
      "Name" = "${local.name_prefix}-Bastion_Server"
    }
  )
}

