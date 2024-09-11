variable "org_name" {
  type = string
}

variable "envShort" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ecs_image" {
  type = string
}

variable "network_vpc_id" {
  type = string
}

variable "network_vswitch_id" {
  type = string
}

variable "private_ip" {
  type = string
}

variable "security_groups" {
  type = list
}