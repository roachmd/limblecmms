variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for connecting to the Kubernetes cluster"
  type        = string
  default     = "~/.kube/config"
}


