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
  source                  = "./ec2"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_az_1a_id  = module.vpc.public_subnet_az_1a_id
  private_subnet_az_1a_id = module.vpc.private_subnet_az_1a_id
  private_subnet_az_1b_id = module.vpc.private_subnet_az_1b_id
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  tags                    = local.project_tags
}

module "alb" {
  source                 = "./alb"
  vpc_id                 = module.vpc.vpc_id
  tags                   = local.project_tags
  public_subnet_az_1a_id = module.vpc.public_subnet_az_1a_id
  public_subnet_az_1b_id = module.vpc.public_subnet_az_1b_id
  ssl_policy             = var.ssl_policy
  certificate_arn        = var.certificate_arn
}

module "auto-scalling" {
  source                 = "./auto-scalling"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_az_1a_id = module.vpc.public_subnet_az_1a_id
  public_subnet_az_1b_id = module.vpc.public_subnet_az_1b_id

  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  tags               = local.project_tags
  max_size           = var.max_size
  min_size           = var.min_size
  desired_capacity   = var.desired_capacity
  jupiter_app_tg_arn = module.alb.jupiter_app_tg_arn
}
module "route53" {
  source          = "./route53"
  name            = var.name
  route53_zone_id = var.route53_zone_id
  alb_dns_name    = module.alb.alb_dns_name
  alb_zone_id     = module.alb.alb_zone_id
}

module "rds" {
  source                   = "./rds"
  rds_secrets_manager_role = module.iam.rds_secrets_manager_role
  engine                   = var.engine
  engine_version           = var.engine_version
  vpc_id                   = module.vpc.vpc_id
  db_name                  = var.db_name
  db_subnet_az_1a          = module.vpc.db_subnet_az_1a
  db_subnet_az_1b          = module.vpc.db_subnet_az_1b
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  parameter_group_name     = var.parameter_group_name
  tags                     = local.project_tags
}

module "iam" {
  source     = "./iam"
  account_id = var.account_id
  region     = var.region
}
