output "eks_role_arn" {
  description = "ARN of the EKS IAM Role"
  value       = aws_iam_role.eks_role.arn
}

output "node_group_role_arn" {
  description = "ARN of the Node Group IAM Role"
  value       = aws_iam_role.node_group_role.arn
}
