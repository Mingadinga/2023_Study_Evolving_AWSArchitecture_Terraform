terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
}

resource "aws_instance" "step1-ec2-terraform" {
  ami           = "ami-0f0cc846201190547"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.step1-sg-terraform.id]
  user_data = <<EOF
#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "step1-ec2-terraform"
  }
}

resource "aws_eip" "step1-eip-terraform" {
  instance = aws_instance.step1-ec2-terraform.id
  vpc      = true
}

resource "aws_security_group" "step1-sg-terraform" {
  name = "allow HTTP"
  ingress {
    from_port = 80
    to_port = 80
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