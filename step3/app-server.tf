resource "aws_instance" "my-php-app-server-1" {
  ami           = "ami-0e28352f8c2da56da"
  instance_type = "t2.micro"
  key_name = "ec2-ssh"
  vpc_security_group_ids = [ aws_security_group.my-php-app-server-sg.id ]
  subnet_id = aws_subnet.my-private-app-subnet-1.id
  tags = {
    Name = "my-php-app-server-1"
  }
}

/* ======== */

resource "aws_instance" "my-php-app-server-2" {
  ami           = "ami-0e28352f8c2da56da"
  instance_type = "t2.micro"
  key_name = "ec2-ssh"
  vpc_security_group_ids = [ aws_security_group.my-php-app-server-sg.id ]
  subnet_id = aws_subnet.my-private-app-subnet-2.id
  tags = {
    Name = "my-php-app-server-2"
  }
}
