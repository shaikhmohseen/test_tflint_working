terraform {
  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
      version = "3.10.1"
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_secretsmanager_secret" "okta_api_token" {
  name = var.api_token_secret_key
}

data "aws_secretsmanager_secret_version" "okta_api_token" {
  secret_id = data.aws_secretsmanager_secret.okta_api_token.id
}

data "aws_ssm_parameter" "global_okta_scopes" {
  name = "/${var.env}/okta-global-scopes"
}

data "aws_ssm_parameter" "global_okta_claims" {
  name = "/${var.env}/okta-global-claims"
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

data "okta_idp_social" "idp_social_id" {
  count = (var.service_name == "watchtower-app" || var.env == "dev" || var.env == "test") ? 1 : 0
  name  = var.okta_idp_name
}

data "okta_idp_oidc" "idp_oidc_id" {
  count = (var.service_name != "watchtower-app" && (var.env == "prod" || var.env == "uat")) ? 1 : 0
  name  = var.okta_idp_name
}

data "okta_user_type" "user_type_id" {
  name = var.okta_user_type
}

#Create scopes
resource "okta_auth_server_scope" "scopes" {
  //TODO: add displayName and description
  count            = (var.service_name == "watchtower-app" || var.env == "dev" || var.env == "uat") ? length(local.scopes) : 0
  auth_server_id   = data.okta_auth_server.default_auth_server.id
  metadata_publish = "ALL_CLIENTS"
  name             = local.scopes[count.index]
  description      = local.scopes[count.index]
  consent          = "IMPLICIT"
}

#Create claims
resource "okta_auth_server_claim" "claims" {
  count          = (var.service_name == "watchtower-app" || var.env == "dev" || var.env == "uat") ? length(local.claims) : 0
  auth_server_id = data.okta_auth_server.default_auth_server.id
  name           = local.claims[count.index]["name"]
  value          = "(appuser != null AND appuser.${local.claims[count.index]["name"]} != null) ? appuser.${local.claims[count.index]["name"]} : user.${local.claims[count.index]["name"]}"
  scopes         = [local.claims[count.index]["scopes"]]
  claim_type     = "RESOURCE"
  depends_on     = [okta_auth_server_scope.scopes]
}

#Create an app
#Step 1: Create app
resource "okta_app_oauth" "app" {
  label = "${var.service_name}-${var.env}"
  type  = "browser"

  grant_types = [
    "authorization_code"
  ]

  login_uri = local.okta_trusted_origin

  post_logout_redirect_uris = local.app_urls

  response_types = [
    "code"
  ]

  redirect_uris = [for s in local.app_urls : "${s}/implicit/callback"]


  token_endpoint_auth_method = "none"
  hide_web                   = false
  hide_ios                   = false
  omit_secret                = null

  lifecycle {
    ignore_changes = [
      //TODO: redirect_uris and post_logout_uris to be ignored only in dev
      users, redirect_uris, post_logout_redirect_uris, hide_ios, hide_web
    ]
  }
}

#Step 2: Add app's url to trusted origin
resource "okta_trusted_origin" "app_trusted_origin" {
  count  = length(local.trusted_origins)
  name   = "${regex("://(.*?)[.].*", local.trusted_origins[count.index])[0]}-${var.env}"
  origin = local.trusted_origins[count.index]
  scopes = [
    "CORS",
    "REDIRECT"
  ]
  lifecycle {
    //TODO: origin and name to be ignored only in dev
    ignore_changes = [origin, name]
  }
}

#Step 3: Add authorization policy for app with permissions for required scopes only
resource "okta_auth_server_policy" "app_authorization_policy" {
  auth_server_id = data.okta_auth_server.default_auth_server.id

  client_whitelist = [
    okta_app_oauth.app.id
  ]

  description = "Default policy for ${okta_app_oauth.app.label}"
  name        = "${okta_app_oauth.app.label}-policy"
  //TODO: set priority greater than 'Default Policy' or set priority of 'Default Policy' the least
  priority = 0
  lifecycle {
    ignore_changes = [
      priority
    ]
  }
}

#Step 4: Add authorization policy rule
resource "okta_auth_server_policy_rule" "app_authorization_policy_rule" {
  auth_server_id = data.okta_auth_server.default_auth_server.id

  grant_type_whitelist = [
    "authorization_code"
  ]

  name = "${okta_app_oauth.app.label}-rule"

  scope_whitelist = concat(["openid", "profile", "email"], var.okta_app_scopes)

  inline_hook_id                = null
  policy_id                     = okta_auth_server_policy.app_authorization_policy.id
  access_token_lifetime_minutes = var.access_token_lifetime_minutes
  refresh_token_window_minutes  = var.refresh_token_window_minutes
  group_whitelist               = ["EVERYONE"]
  priority                      = 0
  depends_on                    = [okta_auth_server_policy.app_authorization_policy, okta_auth_server_scope.scopes]
  lifecycle {
    ignore_changes = [
      priority
    ]
  }
}

#Step 5: Add non-array custom application attributes
resource "okta_app_user_schema" "custom_attributes" {
  count       = length(var.okta_app_custom_attributes)
  app_id      = okta_app_oauth.app.id
  index       = var.okta_app_custom_attributes[count.index].name
  title       = var.okta_app_custom_attributes[count.index].displayName
  type        = var.okta_app_custom_attributes[count.index].type
  description = var.okta_app_custom_attributes[count.index].displayName
  required    = var.okta_app_custom_attributes[count.index].required
  master      = "OKTA"
  scope       = "SELF"
  permissions = "READ_WRITE"
}

#Step 6: Add array custom application attributes
resource "okta_app_user_schema" "custom_array_attributes" {
  count       = length(var.okta_app_custom_array_attributes)
  app_id      = okta_app_oauth.app.id
  index       = var.okta_app_custom_array_attributes[count.index].name
  title       = var.okta_app_custom_array_attributes[count.index].displayName
  type        = var.okta_app_custom_array_attributes[count.index].type
  array_type  = var.okta_app_custom_array_attributes[count.index].arrayType
  description = var.okta_app_custom_array_attributes[count.index].displayName
  required    = var.okta_app_custom_array_attributes[count.index].required
  master      = "OKTA"
  scope       = "SELF"
  permissions = "READ_WRITE"
}

data "aws_secretsmanager_secret" "env_vars_secret_key" {
  name = var.env_vars_secret_key
}

data "aws_secretsmanager_secret_version" "env_vars_secret_key" {
  secret_id = data.aws_secretsmanager_secret.env_vars_secret_key.id
}

resource "aws_secretsmanager_secret_version" "updated_secret" {
  count     = var.update_env_vars_secret ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.env_vars_secret_key.id
  secret_string = jsonencode(
    merge(
      jsondecode(data.aws_secretsmanager_secret_version.env_vars_secret_key.secret_string),
      local.env_vars
    )
  )
}
