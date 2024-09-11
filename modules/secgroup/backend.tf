resource "alicloud_security_group" "backend" {
  name        = "backend-group"
  description = "backend group"
  vpc_id      = var.network_vpc_id
}

resource "alicloud_security_group_rule" "portainer_agent" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = var.operation_instance_ip
  description       = "Portainer Agent"
}

resource "alicloud_security_group_rule" "kong_https" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = "0.0.0.0/0"
  description       = "Kong HTTPS"
}

resource "alicloud_security_group_rule" "kong_http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = var.vpn_client_ip
  # cidr_ip           = "0.0.0.0/0" # temporary
  description       = "Kong HTTP"
}

resource "alicloud_security_group_rule" "konga" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = var.vpn_client_ip
  description       = "Konga UI"
}

resource "alicloud_security_group_rule" "redis_management" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = var.vpn_client_ip
  description       = "Redis Management"
}

resource "alicloud_security_group_rule" "rabbitmq" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "xxxx/xxxx"
  priority          = 1
  security_group_id = alicloud_security_group.backend.id
  cidr_ip           = var.vpn_client_ip
  description       = "RabbitMQ VPN Access"
}