variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "Canned ACL to apply (private, public-read, etc.)"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable S3 versioning"
}

variable "tags" {
  type    = map(string)
  default = {}
}
