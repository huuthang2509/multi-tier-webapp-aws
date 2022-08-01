
data "aws_secretsmanager_secret" "ssm_arn" {
  arn = "arn:aws:secretsmanager:us-west-2:354317781339:secret:rds_password-28HXNu"
}
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.ssm_arn.id
}

resource "aws_db_instance" "example" {
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    name = "my_database"
    username = "admin"
    password = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.db_password.secret_string))["rds_password"]
    skip_final_snapshot = true
}
