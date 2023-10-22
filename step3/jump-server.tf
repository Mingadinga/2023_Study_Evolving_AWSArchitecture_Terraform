resource "aws_instance" "my-jump-server-1" {
  ami           = "ami-0f0cc846201190547"
  instance_type = "t2.micro"
  key_name = "ec2-ssh"
  vpc_security_group_ids = [ aws_security_group.my-jump-server-sg.id ]
  subnet_id = aws_subnet.my-public-web-subnet-1.id
  tags = {
    Name = "my-jump-server-1"
  }
}

/* ======== */

resource "aws_instance" "my-jump-server-2" {
  ami           = "ami-0f0cc846201190547"
  instance_type = "t2.micro"
  key_name = "ec2-ssh"
  vpc_security_group_ids = [ aws_security_group.my-jump-server-sg.id ]
  subnet_id = aws_subnet.my-public-web-subnet-2.id
  tags = {
    Name = "my-jump-server-2"
  }
}
