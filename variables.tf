variable "org_name" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "ecs_image" {
  type = string
}

variable "env_prod" {
  type = string
}

variable "env_short_prod" {
  type = string
}

variable "env_dev" {
  type = string
}

variable "env_short_dev" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}

variable "operation_cidr_template" {
  type = string
}
variable "development_cidr_template" {
  type = string
}

variable "production_cidr_template" {
  type = string
}

variable "vpn_client_ip" {
  type = string
}