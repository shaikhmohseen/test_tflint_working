locals {
  okta_trusted_origin = var.okta_trusted_origin
  base_url            = (var.env == "prod" || var.env == "uat") ? "okta.com" : "oktapreview.com"
  full_base_url       = "https://medly.${local.base_url}"
  app_urls = var.env == "dev" ? concat([
  local.okta_trusted_origin], var.okta_dev_login_and_logout_redirect_uris) : [local.okta_trusted_origin]
  idp_id = (var.service_name == "watchtower-app" || var.env == "dev" || var.env == "test") ? data.okta_idp_social.idp_social_id[0].id : data.okta_idp_oidc.idp_oidc_id[0].id
  env_vars = {
    "AUTH_DOMAIN" : local.full_base_url,
    "AUTH_ISSUER" : "${local.full_base_url}/oauth2/default",
    "APP_CLIENT_ID" : okta_app_oauth.app.client_id,
    "IDPS" : "[{\"id\" : \"${local.idp_id}\", \"type\" : \"${var.okta_idp_type}\" }]",
    "USER_TYPE_ID" : data.okta_user_type.user_type_id.id
  }
  trusted_origins = [for s in local.app_urls : s if(replace(s, "localhost", "") == s)]
  scopes          = tolist(setsubtract(var.okta_app_scopes, split(",", data.aws_ssm_parameter.global_okta_scopes.value)))
  claims          = tolist(setsubtract(var.okta_app_claims, jsondecode(data.aws_ssm_parameter.global_okta_claims.value)))
}
