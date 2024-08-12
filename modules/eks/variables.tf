# EKS Cluster Name
variable "aws_region" {
  description = "The AWS region where the EKS cluster will be deployed"
  type        = string
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the EKS nodes will be deployed"
  type        = list(string)
}

variable "eks_node_groups" {
  description = "Map of EKS node groups and their configurations"
  type = map(object({
    desired_size  = number
    max_size      = number
    min_size      = number
    instance_type = string
  }))
}

variable "ssh_key_name" {
  description = "SSH key name to be used for the EC2 instances in the EKS node groups"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
