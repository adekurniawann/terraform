variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
