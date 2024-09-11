resource "alicloud_security_group" "ssh" {
  name        = "ssh-group"
  description = "ssh access group"
  vpc_id      = var.network_vpc_id
}

resource "alicloud_security_group_rule" "allow_ssh_from_vpn" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.ssh.id
  cidr_ip           = var.vpn_client_ip
  description       = "allow_ssh_from_vpn"
}

resource "alicloud_security_group_rule" "allow_custom_ssh_from_vpn" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.ssh.id
  cidr_ip           = var.vpn_client_ip
  description       = "allow_custom_ssh_from_vpn"
}

resource "alicloud_security_group" "default" {
  name        = "default-group"
  description = "default group"
  vpc_id      = var.network_vpc_id
}