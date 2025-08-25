provider "aws" {
  region = "ap-southeast-3"
}

# VPC
module "vpc" {
  source          = "../../modules/vpc"provider "aws" {
  region = "ap-southeast-3"
}

# VPC
module "vpc" {
  source          = "../../modules/vpc"
  name            = "prod"
  cidr_block      = "172.26..0.0/16"
  azs             = ["ap-southeast-3a", "ap-southeast-3b"]
  public_subnets  = ["172.26..1.0/24", "172.26..2.0/24"]
  private_subnets = ["172.26..11.0/24", "172.26..12.0/24"]
}

# NAT
module "nat" {
  source           = "../../modules/nat-gateway"
  name             = "prod"
  public_subnet_id = module.vpc.public_subnet_ids[0]
}

# IAM Roles
module "eks_role" {
  source            = "../../modules/iam"
  role_name         = "eks-cluster-role"
  service_principal = "eks.amazonaws.com"
  policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

module "eks_node_role" {
  source            = "../../modules/iam"
  role_name         = "eks-node-role"
  service_principal = "ec2.amazonaws.com"
  policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# EKS Cluster
module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "prod-eks"
  cluster_role_arn = module.eks_role.iam_role_arn
  node_role_arn   = module.eks_node_role.iam_role_arn
  subnet_ids      = module.vpc.private_subnet_ids
}

# S3 Bucket
module "s3" {
  source            = "../../modules/s3"
  bucket_name       = "prod-app-storage-1234"
  acl               = "private"
  versioning_enabled = true
  tags = {
    Environment = "prod"
  }
}

# RDS Database
module "rds" {
  source              = "../../modules/rds"
  identifier          = "prod-db"
  engine              = "mysql"
  engine_version      = "8.0.33"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "SuperSecret123!"
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [module.vpc.default_sg_id]
  publicly_accessible = false
  tags = {
    Environment = "prod"
  }
}0
  name            = "prod"
  cidr_block      = "172.26.0.0/16"
  azs             = ["ap-southeast-3a", "ap-southeast-3b"]
  public_subnets  = ["172.26.1.0/24", "172.26.2.0/24"]
  private_subnets = ["172.26.11.0/24", "172.26.12.0/24"]
}

# NAT
module "nat" {
  source           = "../../modules/nat-gateway"
  name             = "prod"
  public_subnet_id = module.vpc.public_subnet_ids[0]
}

# IAM Roles
module "eks_role" {
  source            = "../../modules/iam"
  role_name         = "eks-cluster-role"
  service_principal = "eks.amazonaws.com"
  policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

module "eks_node_role" {
  source            = "../../modules/iam"
  role_name         = "eks-node-role"
  service_principal = "ec2.amazonaws.com"
  policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# EKS Cluster
module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "prod-eks"
  cluster_role_arn = module.eks_role.iam_role_arn
  node_role_arn   = module.eks_node_role.iam_role_arn
  subnet_ids      = module.vpc.private_subnet_ids
}

# S3 Bucket
module "s3" {
  source            = "../../modules/s3"
  bucket_name       = "prod-app-storage-1234"
  acl               = "private"
  versioning_enabled = true
  tags = {
    Environment = "prod"
  }
}

# RDS Database
module "rds" {
  source              = "../../modules/rds"
  identifier          = "prod-db"
  engine              = "mysql"
  engine_version      = "8.0.33"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "SuperSecret123!"
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [module.vpc.default_sg_id]
  publicly_accessible = false
  tags = {
    Environment = "prod"
  }
}