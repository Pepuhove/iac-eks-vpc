variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "af-south-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the cluster."
  type        = list(string)
  default     = []
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.31"
}

variable "node_groups" {
  description = "Map of EKS node group configurations."
  type = map(object({
    desired_size   = number
    max_size       = number
    min_size       = number
    instance_types = list(string)
    capacity_type  = optional(string, "ON_DEMAND")  # Optional, default ON_DEMAND
  }))
  default = {
    default = {
      desired_size   = 2
      max_size       = 2
      min_size       = 1
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
