variable "dbpassword" {
  type = string
  default = "terraform"
}

resource "aws_db_instance" "wordpressbackend" {

  instance_class = "db.t3.micro"
  engine = "mysql"
  publicly_accessible = false
  allocated_storage = 20
  db_name = "wordpress"
  username = "admin"
  password = var.dbpassword
  skip_final_snapshot  = true
  tags = {
    app = "mysql"
  }
  
}