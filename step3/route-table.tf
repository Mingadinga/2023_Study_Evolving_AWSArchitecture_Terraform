resource "aws_route_table" "my-public-web-route-table-1" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }
  
  tags = {
    Name = "my-public-web-route-table-1"
  }
}

resource "aws_route_table_association" "my-public-web-route-table-1-association" {
  subnet_id      = aws_subnet.my-public-web-subnet-1.id
  route_table_id = aws_route_table.my-public-web-route-table-1.id
}


resource "aws_route_table" "my-private-app-route-table-1" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-1.id
  }
  
  tags = {
    Name = "my-private-app-route-table-1"
  }
}

resource "aws_route_table_association" "my-private-app-route-table-1-association" {
  subnet_id      = aws_subnet.my-private-app-subnet-1.id
  route_table_id = aws_route_table.my-private-app-route-table-1.id
}


resource "aws_route_table" "my-private-db-route-table-1" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-1.id
  }
  
  tags = {
    Name = "my-private-db-route-table-1"
  }
}

resource "aws_route_table_association" "my-private-db-route-table-1-association" {
  subnet_id      = aws_subnet.my-private-db-subnet-1.id
  route_table_id = aws_route_table.my-private-db-route-table-1.id
}

/* ======== */

resource "aws_route_table" "my-public-web-route-table-2" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }
  
  tags = {
    Name = "my-public-web-route-table-2"
  }
}

resource "aws_route_table_association" "my-public-web-route-table-2-association" {
  subnet_id      = aws_subnet.my-public-web-subnet-2.id
  route_table_id = aws_route_table.my-public-web-route-table-2.id
}


resource "aws_route_table" "my-private-app-route-table-2" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-2.id
  }
  
  tags = {
    Name = "my-private-app-route-table-2"
  }
}

resource "aws_route_table_association" "my-private-app-route-table-2-association" {
  subnet_id      = aws_subnet.my-private-app-subnet-2.id
  route_table_id = aws_route_table.my-private-app-route-table-2.id
}


resource "aws_route_table" "my-private-db-route-table-2" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-2.id
  }
  
  tags = {
    Name = "my-private-db-route-table-2"
  }
}

resource "aws_route_table_association" "my-private-db-route-table-2-association" {
  subnet_id      = aws_subnet.my-private-db-subnet-2.id
  route_table_id = aws_route_table.my-private-db-route-table-2.id
}