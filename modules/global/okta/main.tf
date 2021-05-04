locals {
  base_url      = (var.env == "prod" || var.env == "uat") ? "okta.com" : "oktapreview.com"
  full_base_url = "https://medly.${local.base_url}"
}


data "aws_secretsmanager_secret" "okta_api_token" {
  name = local.okta_api_token_secret_key
}

data "aws_secretsmanager_secret_version" "okta_api_token" {
  secret_id = data.aws_secretsmanager_secret.okta_api_token.id
}

resource "aws_ssm_parameter" "global_scopes" {
  name  = "/${var.env}/okta-global-scopes"
  type  = "StringList"
  value = join(",", local.okta_global_scopes)
}

resource "aws_ssm_parameter" "global_claims" {
  name  = "/${var.env}/okta-global-claims"
  type  = "String"
  value = jsonencode(local.okta_global_claims)
}

# Configure the Okta Provider
provider "okta" {
  org_name  = "medly"
  base_url  = local.base_url
  api_token = jsondecode(data.aws_secretsmanager_secret_version.okta_api_token.secret_string).API_KEY
}

data "okta_auth_server" "default_auth_server" {
  name = "default"
}

#Create scopes
resource "okta_auth_server_scope" "scopes" {
  count            = (var.env == "dev" || var.env == "uat") ? length(local.okta_global_scopes) : 0
  auth_server_id   = data.okta_auth_server.default_auth_server.id
  metadata_publish = "ALL_CLIENTS"
  name             = local.okta_global_scopes[count.index]
  description      = local.okta_global_scopes[count.index]
  consent          = "IMPLICIT"
}

#Create claims
resource "okta_auth_server_claim" "claims" {
  count          = (var.env == "dev" || var.env == "uat") ? length(local.okta_global_claims) : 0
  auth_server_id = data.okta_auth_server.default_auth_server.id
  name           = local.okta_global_claims[count.index].name
  value          = "(appuser != null AND appuser.${local.okta_global_claims[count.index].name} != null) ? appuser.${local.okta_global_claims[count.index].name} : user.${local.okta_global_claims[count.index].name}"
  scopes         = [local.okta_global_claims[count.index].scopes]
  claim_type     = "RESOURCE"
  depends_on     = [okta_auth_server_scope.scopes]
}

#Add common localhost urls to trusted origins
resource "okta_trusted_origin" "localhost_trusted_origin" {
  count  = var.env == "dev" ? length(local.okta_localhost_app_urls) : 0
  name   = "localhost-${regex("://.*?[:](.*)", local.okta_localhost_app_urls[count.index])[0]}"
  origin = local.okta_localhost_app_urls[count.index]
  scopes = [
    "CORS",
    "REDIRECT"
  ]
  lifecycle {
    ignore_changes = [origin, name]
  }
}
