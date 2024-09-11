resource "alicloud_eip_address" "xxxxxx-ip" {
  address_name         = "xxxxxx-${var.env}-ip"
  bandwidth            = "5"
  internet_charge_type = "PayByTraffic"
  payment_type         = "PayAsYouGo"
}