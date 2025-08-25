variable "identifier" {
  type        = string
  description = "RDS instance identifier"
}

variable "engine" {
  type        = string
  default     = "mysql"
  description = "Database engine (mysql, postgres, etc.)"
}

variable "engine_version" {
  type        = string
  default     = "8.0"
  description = "Database engine version"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS instance type"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Storage size in GB"
}

variable "username" {
  type        = string
  description = "Master username"
}

variable "password" {
  type        = string
  description = "Master password"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for DB subnet group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for the RDS instance"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
  description = "Skip final snapshot on deletion"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Should the DB be publicly accessible?"
}

variable "storage_encrypted" {
  type        = bool
  default     = true
  description = "Encrypt RDS storage"
}

variable "tags" {
  type    = map(string)
  default = {}
}
