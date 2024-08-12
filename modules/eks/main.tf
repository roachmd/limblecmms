provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.23.0" # Adjust to the latest version if needed

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  vpc_id          = var.vpc_id
  subnet_ids = [ "var.subnet_ids" ]
  enable_irsa     = true

  self_managed_node_groups = {
    platform = {
      desired_capacity = var.eks_node_groups["platform"].desired_size
      max_capacity     = var.eks_node_groups["platform"].max_size
      min_capacity     = var.eks_node_groups["platform"].min_size

      instance_type = var.eks_node_groups["platform"].instance_type
      key_name      = var.ssh_key_name
    }

    wordpress = {
      desired_capacity = var.eks_node_groups["wordpress"].desired_size
      max_capacity     = var.eks_node_groups["wordpress"].max_size
      min_capacity     = var.eks_node_groups["wordpress"].min_size

      instance_type = var.eks_node_groups["wordpress"].instance_type
      key_name      = var.ssh_key_name
    }
  }

  tags = var.tags
}
