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
  node_role_arn   = module.eks.node_groups["eks_nodes"].node_group_role_arn
  subnet_ids      = module.vpc.private_subnets
  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
  instance_type    = var.instance_type
  tags             = var.tags
}
