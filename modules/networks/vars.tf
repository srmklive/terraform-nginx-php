variable "instance_tag" {
  type = string
  default = "Terraform"
}

variable "availability_zone" {
  type = string
}

variable "open_cidr_block" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_private_cidr_block" {
  type = string
}

variable "vpc_private_cidr_block2" {
  type = string
}

variable "igw_cidr_block" {
  type = string
}

variable "igw_cidr_block2" {
  type = string
}