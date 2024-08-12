output "mariadb_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.mariadb.id
}

output "mariadb_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.mariadb.endpoint
}

output "mariadb_username" {
  description = "The master username for the RDS instance"
  value       = aws_db_instance.mariadb.username
}

output "mariadb_db_name" {
  description = "The name of the database"
  value       = aws_db_instance.mariadb.db_name
}

