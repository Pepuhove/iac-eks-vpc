output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "node_groups" {
  description = "Map of EKS node group names"
  value       = { for k, ng in aws_eks_node_group.main : k => ng.node_group_name }
}
