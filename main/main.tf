terraform {
  required_version = ">= 1.9.4"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "../modules/vpc"
  cidr_block  = var.vpc_cidr_block
  subnet_count = var.subnet_count
  availability_zones = var.availability_zones
  environment = "dev"
  aws_region = ""
}

module "rds" {
  source                = "../modules/rds"
  allocated_storage     = 20
  instance_class        = "db.t3.micro"
  db_name               = "wordpress"
  username              = "admin"
  password              = "password123"
  parameter_group_name  = "default.mariadb10.3"
  publicly_accessible   = false
  security_group_ids = []
  subnet_group       = ""
}

module "eks" {
  source         = "../modules/eks"
  vpc_id         = module.vpc.this_vpc_id
  tags           = { Environment = "dev" }
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  eks_node_groups = var.eks_node_groups
  ssh_key_name = ""
  subnet_ids = [ "module.vpc.public_subnets[*]" ]
  aws_region = "us-east-2"
}

module "cert-manager" {
  source = "../modules/cert-manager"
  cluster_name = var.eks_cluster_name
  vpc_id = module.vpc.this_vpc_id
  cluster_version = "1.21"
  kubeconfig_path = "~/.kube/config"
}

module "wordpress" {
  source             = "../modules/wordpress"
  kubeconfig_path    = "~/.kube/config"
  db_host            = module.rds.mariadb_endpoint
  db_user            = var.db_user
  db_password        = var.db_password
  db_name            = var.db_name
  hostname           = "wordpress.example.com"
  cert_manager_issuer = "letsencrypt-prod"
}

