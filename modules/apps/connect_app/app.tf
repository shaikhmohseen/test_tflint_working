module "amplify" {
  source                           = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-amplify-app/v1.2.1.zip"
  deployment_account               = local.deployment_account
  service_name                     = local.service_name
  env                              = var.env
  amplify_repository_url           = "https://github.com/medlypharmacy/connect-app"
  amplify_github_enabled           = local.amplify_github_enabled
  domain_name                      = local.amplify_domain
  amplify_branch_patterns          = "connect-*,CONNECT-*"
  amplify_backend_apigw_invoke_url = "https://providers-gw.${var.env == "prod" ? "" : "${var.env}-"}medly.io"
  amplify_subdomain                = local.amplify_subdomain
  npm_token                        = ""
  env_vars_secret_key              = local.env_vars_secret_key
  tags                             = var.tags
}


module "okta_app" {
  source                                  = "../../resources/okta_app"
  service_name                            = local.service_name
  env                                     = var.env
  env_vars_secret_key                     = local.env_vars_secret_key
  api_token_secret_key                    = local.okta_api_token_secret_key
  okta_trusted_origin                     = "https://${local.amplify_subdomain}.${local.amplify_domain}"
  update_env_vars_secret                  = var.update_env_vars_secret
  okta_idp_name                           = var.okta_idp_name
  okta_idp_type                           = var.okta_idp_type
  okta_app_scopes                         = local.okta_app_scopes
  okta_user_type                          = local.okta_user_type
  okta_app_custom_attributes              = local.okta_app_custom_attributes
  okta_app_custom_array_attributes        = local.okta_app_custom_array_attributes
  okta_app_claims                         = local.okta_app_claims
  okta_dev_login_and_logout_redirect_uris = var.okta_dev_login_and_logout_redirect_uris
}
