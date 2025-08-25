output "rds_id" {
  value       = aws_db_instance.this.id
  description = "The RDS instance ID"
}

output "rds_endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "The RDS instance endpoint"
}

output "rds_arn" {
  value       = aws_db_instance.this.arn
  description = "The ARN of the RDS instance"
}