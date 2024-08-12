resource "aws_db_instance" "mariadb" {
  allocated_storage    = var.allocated_storage
  engine               = "mariadb"
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible  = var.publicly_accessible

  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = var.subnet_group
}

