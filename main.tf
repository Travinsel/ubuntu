provider "aws" {
  region                   = "us-east-2"
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "main_subnet"
  }
}

resource "aws_instance" "tfvm2" {
  ami                    = "ami-02bf8ce06a8ed6092"
  instance_type          = "t2.micro"
  key_name               = "Linux"
  availability_zone      = "us-east-2a"
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow.id]

  tags = {
    Name = "test-vm"
  }
}

resource "aws_security_group" "allow" {
  name        = "vpc"
  description = "Allow HTTP inbound traffic"

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group_rule" "allow_http_ingress" {
  security_group_id = aws_security_group.allow.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block] # Reference to the VPC CIDR block
}

resource "aws_security_group_rule" "allow_all_egress" {
  security_group_id = aws_security_group.allow.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
