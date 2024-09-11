# terraform {
#   backend "http" {
#   }
# }

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "vpc" {
  source = "./modules/vpc"

  org_name       = var.org_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "operation-vswitch" {
  source = "./modules/vswitch"

  env                = "operation"
  vpc_id             = module.vpc.vpc_id
  vswitch_cidr_block = "${var.operation_cidr_template}.0/24"
}

module "backend-vswitch" {
  source = "./modules/vswitch"

  env                = var.env_dev
  vpc_id             = module.vpc.vpc_id
  vswitch_cidr_block = "${var.development_cidr_template}.0/24"
}

module "production-vswitch" {
  source = "./modules/vswitch"

  env                = var.env_prod
  vpc_id             = module.vpc.vpc_id
  vswitch_cidr_block = "${var.production_cidr_template}.0/24"
}

module "vpn" {
  source = "./modules/vpn"

  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  vpn_client_ip  = var.vpn_client_ip
  org_name       = var.org_name
}

module "eip" {
  source = "./modules/eip"

  env = var.env_dev
}

module "production-eip" {
  source = "./modules/eip"

  env = var.env_prod
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  org_name   = var.org_name
  vpc_id     = module.vpc.vpc_id
  vswitch_id = module.backend-vswitch.vswitch_id
}

module "secgroup" {
  source = "./modules/secgroup"

  network_vpc_id = module.vpc.vpc_id
  vpn_client_ip  = var.vpn_client_ip
  operation_instance_ip = "${var.operation_cidr_template}.10"
}

module "operation" {
  source = "./modules/ecs"

  org_name           = var.org_name
  envShort           = "operation"
  instance_type      = "ecs.g7.large"
  ecs_image          = var.ecs_image
  network_vpc_id     = module.vpc.vpc_id
  network_vswitch_id = module.operation-vswitch.vswitch_id
  private_ip         = "${var.operation_cidr_template}.10"
  security_groups = [
    module.secgroup.secgroup_ssh_id,
    module.secgroup.secgroup_operation_id
  ]
}

module "backend" {
  source = "./modules/ecs"

  org_name           = var.org_name
  envShort           = var.env_short_dev
  instance_type      = "ecs.g7.large"
  ecs_image          = var.ecs_image
  network_vpc_id     = module.vpc.vpc_id
  network_vswitch_id = module.backend-vswitch.vswitch_id
  private_ip         = "${var.development_cidr_template}.10"
  security_groups = [
    module.secgroup.secgroup_ssh_id,
    module.secgroup.secgroup_backend_id
  ]
}

module "production-backend" {
  source = "./modules/ecs"

  org_name           = var.org_name
  envShort           = var.env_short_prod
  instance_type      = "ecs.g7.large"
  ecs_image          = var.ecs_image
  network_vpc_id     = module.vpc.vpc_id
  network_vswitch_id = module.production-vswitch.vswitch_id
  private_ip         = "${var.production_cidr_template}.10"
  security_groups = [
    module.secgroup.secgroup_ssh_id,
    module.secgroup.secgroup_backend_id
  ]
}

module "rds" {
  source = "./modules/rds"

  env                = var.env_dev
  network_vswitch_id = module.backend-vswitch.vswitch_id
  vswitch_cidr_block = "${var.development_cidr_template}.0/24"
}

# module "production-rds" {
#   source = "./modules/rds"

#   env                = var.env_prod
#   network_vswitch_id = module.production-vswitch.vswitch_id
#   vswitch_cidr_block = "${var.production_cidr_template}.0/24"
# }

module "storage" {
  source = "./modules/storage"

  env      = var.env_dev
  org_name = var.org_name
}
