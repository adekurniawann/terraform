output "node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.managed.node_group_name
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.managed.arn
}
