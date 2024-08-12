provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.10.1"

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "replicaCount"
    value = "2"
  }
}
