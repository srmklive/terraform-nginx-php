output "url" {
  value = "http://${aws_instance.web_server.public_ip}"
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}
