resource "aws_instance" "vm1" {
  ami               = var.ami_id
  availability_zone = var.az
  instance_type     = var.itype
  key_name          = var.kname
  vpc_security_group_ids = [
    "sg-0899a50214affc941",
    "sg-06f62d870e94162a5",
    "sg-055207ba771b9ce6f",
    aws_security_group.tfsg1.id
  ]
  depends_on = [aws_security_group.tfsg1]


  tags = {
    Name = var.ec2name
    iac  = "terraform"
  }
}


resource "aws_ec2_instance_state" "vm1state" {
  instance_id = aws_instance.vm1.id
  state       = "stopped"
}


resource "aws_security_group" "tfsg1" {
  name        = "https"
  description = "allow https"
  vpc_id      = "vpc-03d679b014eb0bfea"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow inbound https"

  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all outbound"
  }
}