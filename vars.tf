variable "instance_type" {
  type = string
}

variable "instance_tag" {
  type = string
}

variable "key_name" {
  default = "TF-TEST"
}

variable "availability_zone" {
  default = "us-east-1"
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
