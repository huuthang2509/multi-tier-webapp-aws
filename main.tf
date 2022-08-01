terraform {
  backend "s3" {
    key     = "aws-webapp"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

# module "autoscaling" {
#   source = "./autoscaling"
# }

module "database" {
  source = "./database"
}

# module "networking" {
#   source = "./networking"da
# }

# terraform {
#   backend "s3" {
#     bucket         = "s3-backend-state-bucket"
#     key            = "aws-webapp"
#     dynamodb_table = "s3-backend-state-lock"
#     region         = "us-west-2"
#     role_arn       = "arn:aws:iam::354317781339:role/s3-backend-tf-assume-role"
#     encrypt        = true
#   }
# }