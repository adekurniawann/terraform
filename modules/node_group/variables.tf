variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the node group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the node group"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "instance_type" {
  description = "Instance type for worker nodes"
  type        = string
}

variable "tags" {
  description = "Tags for the node group"
  type        = map(string)
}
