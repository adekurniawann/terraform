provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  name            = var.cluster_name
  cidr            = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  tags            = var.tags
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
  tags         = var.tags
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  tags            = var.tags
}

module "node_group" {
  source          = "./modules/node_group"
  cluster_name    = module.eks.cluster_name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = module.iam.node_group_role_arn
  subnet_ids      = module.vpc.private_subnets
  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
  instance_type    = var.instance_type
  tags             = var.tags
}

module "rds" {
  source                = "./modules/database"
  db_identifier         = var.db_identifier
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  allocated_storage     = var.db_allocated_storage
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  parameter_group_name  = var.db_parameter_group_name
  vpc_security_group_ids = [module.vpc.vpc_default_security_group_id]
  private_subnets       = module.vpc.private_subnets
  tags                  = var.tags
}
