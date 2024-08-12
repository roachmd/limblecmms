# AWS region
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

# VPC configuration
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = number
}

variable "availability_zones" {
  description = "List of availability zones for subnet distribution"
  type        = list(string)
}

# RDS (MariaDB) configuration
variable "db_instance_class" {
  description = "The instance type for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the MariaDB database"
  type        = string
}

variable "db_user" {
  description = "The username for the MariaDB database"
  type        = string
}

variable "db_password" {
  description = "The password for the MariaDB database"
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
}

variable "db_parameter_group_name" {
  description = "The parameter group name for the RDS instance"
  type        = string
}

# EKS configuration
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
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

# cert-manager configuration
variable "cert_manager_issuer" {
  description = "The cert-manager ClusterIssuer to use for TLS certificates"
  type        = string
}

# WordPress configuration
variable "wordpress_hostname" {
  description = "The hostname for the WordPress site"
  type        = string
}
