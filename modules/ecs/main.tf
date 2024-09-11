resource "alicloud_instance" "backend_instance" {
  availability_zone    = "ap-southeast-5a"
  host_name            = "${var.org_name}-${var.envShort}"
  image_id             = var.ecs_image
  instance_name        = "${var.org_name}_${var.envShort}"
  instance_type        = var.instance_type
  maintenance_action   = "AutoRecover"
  security_groups      = var.security_groups
  system_disk_category = "cloud_essd"
  system_disk_size     = 100
  vswitch_id           = var.network_vswitch_id
  private_ip           = var.private_ip
  password             = ""
  instance_charge_type = "PrePaid"
  period               = 1
  renewal_status       = "AutoRenewal"
}
