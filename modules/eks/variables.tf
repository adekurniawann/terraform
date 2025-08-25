variable "cluster_name" { type = string }
variable "cluster_role_arn" { type = string }
variable "node_role_arn" { type = string }
variable "subnet_ids" { type = list(string) }

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "desired_size" { type = number default = 2 }
variable "max_size" { type = number default = 4 }
variable "min_size" { type = number default = 1 }
