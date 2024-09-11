resource "alicloud_vpn_gateway" "vpn_gateway" {
  name                 = "${var.org_name}-vpn-gateway"
  vpc_id               = var.vpc_id
  bandwidth            = "100"
  enable_ssl           = true
  instance_charge_type = "PostPaid"
  ssl_connections      = 10
}

resource "alicloud_ssl_vpn_server" "vpn_server" {
  name           = "${var.org_name}-ssl-server"
  vpn_gateway_id = alicloud_vpn_gateway.vpn_gateway.id
  client_ip_pool = var.vpn_client_ip
  local_subnet   = var.vpc_cidr_block
  protocol       = "UDP"
  cipher         = "AES-128-CBC"
  port           = 1194
  compress       = "false"
}
