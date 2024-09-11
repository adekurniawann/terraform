resource "alicloud_vswitch" "vswitch" {
  vswitch_name = "xxxx-${var.env}-vswitch"
  vpc_id       = var.vpc_id
  cidr_block   = var.vswitch_cidr_block
  zone_id      = "ap-southeast-5a"
}