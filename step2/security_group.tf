resource "aws_security_group" "FESG" {
  name = "allow ssh & http"

  ingress{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"  
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow http"
    from_port = 0
    to_port = 80
    protocol = "tcp"
  } 

  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "permit all"
    from_port = 0
    to_port = 0
    protocol = "-1"
  } 
  
}