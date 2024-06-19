output "subnet_tf_web" {
  value = aws_subnet.tf-web.id
}

output "subnet_tf_web2" {
  value = aws_subnet.tf-web1.id
}

output "subnet_tf_rds" {
  value = aws_subnet.tf-rds.id
}

output "subnet_tf_rds2" {
  value = aws_subnet.tf-rds2.id
}

output "vpc_id" {
  value = aws_vpc.tf-vpc.id
}

output "sg_tf_web" {
  value = aws_security_group.sg-tf-web.id
}

output "sg_tf_rds" {
  value = aws_security_group.sg-tf-db.id
}