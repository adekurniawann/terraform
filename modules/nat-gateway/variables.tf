variable "name" {
  type        = string
  description = "Name prefix for NAT Gateway"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet for NAT Gateway"
}
