output "secgroup_ssh_id" {
  value = alicloud_security_group.ssh.id
}

output "secgroup_default_id" {
  value = alicloud_security_group.default.id
}

output "secgroup_backend_id" {
  value = alicloud_security_group.backend.id
}

output "secgroup_operation_id" {
  value = alicloud_security_group.operation.id
}