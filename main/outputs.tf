output "vpc_id" {
  value = module.vpc.this_vpc_id
}


output "rds_endpoint" {
  value = module.rds.mariadb_endpoint
}

output "wordpress_url" {
  value = module.wordpress.wordpress_url
}
