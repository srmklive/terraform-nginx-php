resource "aws_security_group" "sg-test-web" {
  name = "sg_test_web"
  description = "Security Group for Web Server"
  vpc_id = var.vpc_id

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg-test-web.id]
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/lemp_ubuntu.sh")

  tags = {
    Name = var.instance_tag
  }

  root_block_device {
    delete_on_termination = "true"
  }
}
