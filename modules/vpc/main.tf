resource "alicloud_vpc" "vpc" {
  vpc_name   = "${var.org_name}-vpc"
  cidr_block = var.vpc_cidr_block
}
