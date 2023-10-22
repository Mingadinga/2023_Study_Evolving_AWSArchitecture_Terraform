resource "aws_security_group" "my-jump-server-sg" {
  name = "my-jump-server-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  } 
  
}

resource "aws_security_group" "my-php-app-server-sg" {
  name = "my-php-app-server-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    security_groups = [ aws_security_group.my-alb-sg.id ]
    description = "allow alb"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    security_groups = [ aws_security_group.my-jump-server-sg.id ]
    description = "allow jump server"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  
}

resource "aws_security_group" "my-alb-sg" {
  name = "my-alb-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  
}


resource "aws_security_group" "my-db-sg" {
  name = "my-db-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow mysql"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
  }

  ingress {
    security_groups = [ aws_security_group.my-php-app-server-sg.id ]
    description = "allow app"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }

}