resource "aws_ssm_parameter" "okta_auth_url" {
  name        = "/${var.env}/oktaAuthUrl"
  description = "Global Okta Auth URL"
  type        = "String"
  value       = var.okta_auth_url
}

resource "aws_ssm_parameter" "okta_base_url" {
  name        = "/${var.env}/oktaBaseUrl"
  description = "Okta Base URL"
  type        = "String"
  value       = var.okta_base_url
}
