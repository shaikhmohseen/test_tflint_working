output "env_secrets" {
  value = local.env_vars
}

output "auth_server" {
  value = data.okta_auth_server.default_auth_server
}