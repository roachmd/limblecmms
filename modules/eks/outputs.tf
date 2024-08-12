output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "The security group ID of the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "eks_node_group_role_arn" {
  description = "The ARN of the node group IAM role"
  value       = module.eks.node_security_group_arn
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = module.eks.cluster_version
}
