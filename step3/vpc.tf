resource "aws_vpc" "my-vpc" {
  cidr_block       = "172.20.0.0/20"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}