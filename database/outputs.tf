output "db_value" {
  value = {
    db_password = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.db_password.secret_string))["rds_password"]
  }
}