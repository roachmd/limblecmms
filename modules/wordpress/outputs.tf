output "wordpress_url" {
  description = "The URL of the deployed WordPress site"
  value       = "https://${var.hostname}"
}

output "wordpress_admin_password" {
  description = "The admin password for the WordPress site"
  value       = helm_release.wordpress.pass_credentials
}
