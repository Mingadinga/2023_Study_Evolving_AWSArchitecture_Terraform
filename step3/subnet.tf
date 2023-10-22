resource "aws_subnet" "my-public-web-subnet-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-web-subnet-1"
  }
}

resource "aws_subnet" "my-private-app-subnet-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.3.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-app-subnet-1"
  }
}

resource "aws_subnet" "my-private-db-subnet-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.4.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-db-subnet-1"
  }
}

/* ======== */

resource "aws_subnet" "my-public-web-subnet-2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.2.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-web-subnet-2"
  }
}

resource "aws_subnet" "my-private-app-subnet-2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.5.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-app-subnet-2"
  }
}

resource "aws_subnet" "my-private-db-subnet-2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "172.20.6.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-db-subnet-2"
  }
}