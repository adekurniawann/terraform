variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "The amount of allocated storage (in gigabytes)"
  type        = number
}

variable "engine" {
  description = "The database engine (e.g., postgres)"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "The instance type for the RDS database"
  type        = string
}

variable "parameter_group_name" {
  description = "The parameter group to associate with the RDS instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets for the database"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the RDS instance"
  type        = map(string)
}
