output "cert_manager_id" {
  description = "The ID of the cert-manager Helm release"
  value       = helm_release.cert_manager.id
}

output "cert_manager_version" {
  description = "The version of cert-manager deployed"
  value       = helm_release.cert_manager.version
}


