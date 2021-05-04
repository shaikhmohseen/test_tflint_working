output "private_key" {
  value = tls_private_key.default.private_key_pem
}

output "security_group_id" {
  value = module.eb_environment.beanstalk_security_group_id
}
