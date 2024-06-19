data "aws_kms_alias" "s3" {
  name = "alias/aws/s3"
}

data "aws_s3_bucket" "s3-tf-state" {
  bucket = "srmk-terraform-state"
}

data "aws_ami_ids" "ubuntu" {
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-22-*-amd64-server-*"]
  }
}