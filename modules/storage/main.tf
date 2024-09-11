resource "alicloud_oss_bucket" "bucket" {
  bucket = "${var.org_name}-bucket"
  acl    = "private"
}