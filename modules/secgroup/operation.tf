resource "alicloud_security_group" "operation" {
  name        = "operation-group"
  description = "operation access group"
  vpc_id      = var.network_vpc_id
}

resource "alicloud_security_group_rule" "portainer_ui" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.operation.id
  cidr_ip           = var.vpn_client_ip
  description       = "Portainer UI"
}

resource "alicloud_security_group_rule" "adminer" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.operation.id
  cidr_ip           = var.vpn_client_ip
  description       = "Adminer"
}
