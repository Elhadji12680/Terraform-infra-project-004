provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "tfstate-remote-backend-002"
    key            = "jupiter/statefile"
    region         = "us-east-1"
    dynamodb_table = "jupiter-state-locking-002"
    encrypt        = true
  }
}

module "vpc" {
  source         = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = local.project_tags
}