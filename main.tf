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
  source            = "./vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags              = local.project_tags
}

module "ec2" {
  source                     = "./ec2"
  vpc_id                     = module.vpc.vpc_id
  subnet_id                  = module.vpc.subnet_id
  bastion_host_ami           = var.bastion_host_ami
  bastion_host_instance_type = var.bastion_host_instance_type
  key_name                   = var.key_name
  tags                       = local.project_tags
}
