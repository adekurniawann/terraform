resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  identifier           = var.db_identifier
  name                 = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot  = true

  publicly_accessible  = false
  backup_retention_period = 7

  tags = var.tags
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.private_subnets

  tags = var.tags
}
