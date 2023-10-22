variable "dbpassword" {
  type = string
  default = "terraform"
}

resource "aws_db_subnet_group" "my-db-subnet-group" {
//   name       = "my-db-subnet-group"
  subnet_ids = [ aws_subnet.my-private-db-subnet-1.id, aws_subnet.my-private-db-subnet-2.id ] 

  tags = {
    Name = "my-db-subnet-group"
  }
}

resource "aws_db_instance" "my-db" {

  instance_class = "db.m6g.large"
  engine = "mysql"
  publicly_accessible = false
  db_name = "mydb"
  username = "admin"
  password = var.dbpassword
  skip_final_snapshot = true

  multi_az = true
  vpc_security_group_ids = [ aws_security_group.my-db-sg.id ]
  db_subnet_group_name = aws_db_subnet_group.my-db-subnet-group.id
  
  storage_type = "io1"
  allocated_storage = 400
  iops = 3000

  tags = {
    Name = "my-db"
  }
  
}

resource "aws_db_instance" "replica-postgresql-rds" {
  instance_class       = "db.m6g.large"
  skip_final_snapshot  = true
  backup_retention_period = 7
  replicate_source_db = aws_db_instance.my-db.identifier
}