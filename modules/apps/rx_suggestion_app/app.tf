module "amplify" {
  source                           = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-amplify-app/v1.1.2.zip"
  deployment_account               = local.deployment_account
  service_name                     = local.service_name
  env                              = var.env
  amplify_repository_url           = "https://github.com/medlypharmacy/rx-suggestion-app"
  amplify_github_enabled           = local.amplify_github_enabled
  domain_name                      = "${var.env == "prod" ? "" : "${var.env}-"}medly.${var.env == "prod" ? "com" : "io"}"
  amplify_branch_patterns          = "rxs-*"
  amplify_backend_apigw_invoke_url = "https://api-gw.${var.env == "prod" ? "" : "${var.env}-"}medly.io"
  amplify_subdomain                = "rxs"
  npm_token                        = ""
  env_vars_secret_key              = local.env_vars_secret_key
  tags                             = var.tags
}
