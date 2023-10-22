resource "aws_eip" "my-eip-1" {
  vpc      = true
  tags = {
    Name = "my-eip-1"
  }
}

resource "aws_nat_gateway" "my-nat-gateway-1" {
  allocation_id = aws_eip.my-eip-1.id
  subnet_id     = aws_subnet.my-public-web-subnet-1.id

  tags = {
    Name = "my-nat-gateway-1"
  }

  depends_on = [aws_internet_gateway.my-internet-gateway]
}

/* ======== */

resource "aws_eip" "my-eip-2" {
  vpc      = true
  tags = {
    Name = "my-eip-2"
  }
}

resource "aws_nat_gateway" "my-nat-gateway-2" {
  allocation_id = aws_eip.my-eip-2.id
  subnet_id     = aws_subnet.my-public-web-subnet-2.id

  tags = {
    Name = "my-nat-gateway-2"
  }

  depends_on = [aws_internet_gateway.my-internet-gateway]
}