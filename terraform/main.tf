terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket       = "iac-bucket-1214"
    key          = "terraform.tfstate"
    region       = "af-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  cluster_name         = var.cluster_name
}

module "eks" {
  source       = "./modules/eks"
  aws_region   = var.aws_region
  # vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnet_ids
  node_groups  = var.node_groups
}

module "ecr" {
  source                = "./modules/ecr"
  aws_repository_name   = var.aws_repository_name

}