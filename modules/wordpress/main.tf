provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version    = "15.0.0"

  set {
    name  = "mariadb.enabled"
    value = "false"
  }

  set {
    name  = "externalDatabase.host"
    value = var.db_host
  }

  set {
    name  = "externalDatabase.user"
    value = var.db_user
  }

  set {
    name  = "externalDatabase.password"
    value = var.db_password
  }

  set {
    name  = "externalDatabase.database"
    value = var.db_name
  }

  set {
    name  = "externalDatabase.port"
    value = "3306"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hostname"
    value = var.hostname
  }

  set {
    name  = "ingress.annotations"
    value = jsonencode({
      "kubernetes.io/ingress.class"            = "nginx",
      "cert-manager.io/cluster-issuer"         = var.cert_manager_issuer,
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
    })
  }

  set {
    name  = "ingress.tls[0].hosts[0]"
    value = var.hostname
  }

  set {
    name  = "ingress.tls[0].secretName"
    value = "wordpress-tls"
  }
}
