resource "alicloud_nat_gateway" "enhanced" {
  vpc_id           = var.vpc_id
  nat_gateway_name = "${var.org_name}-nat-gateway"
  payment_type     = "PayAsYouGo"
  vswitch_id       = var.vswitch_id
  nat_type         = "Enhanced"
}