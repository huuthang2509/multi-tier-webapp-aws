provider "aws" {
  region = "us-west-2"
}

module "autoscaling" {
  source = "./autoscaling"
}

module "database" {
  source = "./database"
}

module "networking" {
  source = "./networking"
}