output "s3-kms-key" {
    value = data.aws_kms_alias.s3.arn
}

output "s3-tf-state" {
    value = data.aws_s3_bucket.s3-tf-state.arn
}

output "ami-id" {
    value = data.aws_ami_ids.ubuntu.ids
}