variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for connecting to the Kubernetes cluster"
  type        = string
  default     = "~/.kube/config"
}

variable "db_host" {
  description = "The endpoint of the external MariaDB database"
  type        = string
}

variable "db_user" {
  description = "The username for the MariaDB database"
  type        = string
}

variable "db_password" {
  description = "The password for the MariaDB database"
  type        = string
}

variable "db_name" {
  description = "The name of the MariaDB database"
  type        = string
}

variable "hostname" {
  description = "The hostname for the WordPress site"
  type        = string
}

variable "cert_manager_issuer" {
  description = "The name of the cert-manager ClusterIssuer to use for TLS certificates"
  type        = string
}
