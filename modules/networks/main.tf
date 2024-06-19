resource "aws_vpc" "tf-vpc" {
  cidr_block            = "${var.vpc_cidr_block}"
  enable_dns_hostnames  = true
  tags = {
    Name = "VPC - ${var.instance_tag}"
  }
}

resource "aws_security_group" "sg-tf-web" {
  name = "sg_tf_web"
  description = "Security Group for Web Server"
  vpc_id = aws_vpc.tf-vpc.id

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [var.open_cidr_block]
  }

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [var.open_cidr_block]
  }  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.open_cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.open_cidr_block]
  }
}

resource "aws_security_group" "sg-tf-db" {
  name = "test-db"
  description = "Security Group for RDS"
  vpc_id = aws_vpc.tf-vpc.id

  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    security_groups = [aws_security_group.sg-tf-web.id]
  }

  tags = {
    Name = "Database ${var.instance_tag}"
  }
}

resource "aws_subnet" "tf-web" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "${var.igw_cidr_block}"
  availability_zone = "${var.availability_zone}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet Web - ${var.instance_tag}"
  }
}

resource "aws_subnet" "tf-web1" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "${var.igw_cidr_block2}"
  availability_zone = "${var.availability_zone}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet 2 Web - ${var.instance_tag}"
  }
}

resource "aws_subnet" "tf-rds" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "${var.vpc_private_cidr_block}"
  availability_zone = "${var.availability_zone}a"
  tags = {
    Name = "Subnet RDS - ${var.instance_tag}"
  }
}

resource "aws_subnet" "tf-rds2" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "${var.vpc_private_cidr_block2}"
  availability_zone = "${var.availability_zone}b"
  tags = {
    Name = "Subnet RDS - ${var.instance_tag}"
  }
}

resource "aws_internet_gateway" "igw_tf" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "Internet Gateway -  ${var.instance_tag}"
  }
}

resource "aws_route_table" "route" {
  vpc_id = "${aws_vpc.tf-vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw_tf.id}"
  }

  tags = {
      Name = "Route to internet"
  }
}

resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_subnet.tf-web.id}"
    route_table_id = "${aws_route_table.route.id}"
}

resource "aws_route_table_association" "rt2" {
    subnet_id = "${aws_subnet.tf-web1.id}"
    route_table_id = "${aws_route_table.route.id}"
}

resource "aws_route_table" "rds-route" {
  vpc_id = "${aws_vpc.tf-vpc.id}"

  tags = {
      Name = "Route #1 to RDS"
  }
}

resource "aws_route_table_association" "rt_rds1" {
    subnet_id = "${aws_subnet.tf-rds.id}"
    route_table_id = "${aws_route_table.rds-route.id}"
}

resource "aws_route_table_association" "rt_rds2" {
    subnet_id = "${aws_subnet.tf-rds2.id}"
    route_table_id = "${aws_route_table.rds-route.id}"
}