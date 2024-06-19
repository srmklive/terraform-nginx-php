resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  subnet_id              = var.subnet_id
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
  user_data              = file("${path.module}/scripts/install_dependencies.sh")

  tags = {
    Name = var.instance_tag
  }

  root_block_device {
    delete_on_termination = "true"
  }
}
