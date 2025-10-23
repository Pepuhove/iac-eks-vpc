variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "af-south-1"

}

variable "aws_repository_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "my-ecr-repo"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones for the VPC."
  type        = list(string)
  default     = ["af-south-1a", "af-south-1b", "af-south-1c"]

}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

}

variable "node_group_instance_types" {
  description = "List of instance types for the EKS node group."
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    desired_size   = number
    max_size       = number
    min_size       = number
    instance_types = list(string)
  }))
  default = {
    default = {
      desired_size   = 2
      max_size       = 2
      min_size       = 1
      instance_types = ["t3.small"]
    }
  }
}


variable "subnet_ids" {
  description = "List of subnet IDs."
  type        = list(string)
  default     = []

}