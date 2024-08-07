variable "ami" {
  description = "AMI ID used to provision EC2"
}

variable "instance_name" {
  default = "app_server"
}

variable "instance_type" {
  description = "Instance Type to provision for EC2"
}

variable "instance_tag" {
  default = "Terraform EC2 Test"
}

variable "key_name" {
  description = "SSH Key used for the servers."
}

variable "subnet_id" {
  description = "Subnet ID information for the Web servers."
}

variable "vpc_id" {
  description = "VPC ID information for TF servers."
}

variable "security_group" {
  description = "Security Group ID information."
}

variable "region" {
  description = "AWS Region information."
}