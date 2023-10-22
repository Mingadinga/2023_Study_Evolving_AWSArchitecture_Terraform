resource "aws_instance" "wordpressfrontend" {
  ami           = "ami-0f0cc846201190547"
  instance_type = "t2.micro"
  key_name = "ec2-ssh"
  security_groups = [ "allow ssh & http" ]
  tags = {
    app = "wordpress"
    role = "frontend"
  }
}

resource "aws_eip" "wpip" {
  instance = aws_instance.wordpressfrontend.id
  vpc      = true
  tags = {
    app = "wordpress"
  }
}