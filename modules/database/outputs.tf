output "rds_endpoint" {
  description = "The endpoint of the RDS database"
  value       = aws_db_instance.rds.endpoint
}

output "rds_db_name" {
  description = "The name of the database"
  value       = aws_db_instance.rds.name
}
