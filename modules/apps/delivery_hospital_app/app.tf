module "amplify" {
  source                           = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-amplify-app/v1.1.2.zip"
  deployment_account               = var.deployment_account
  service_name                     = var.service_name
  env                              = var.env
  amplify_repository_url           = var.amplify_repository_url
  amplify_github_enabled           = var.amplify_github_enabled
  domain_name                      = var.domain_name
  amplify_branch_patterns          = var.amplify_branch_patterns
  amplify_backend_apigw_invoke_url = var.amplify_backend_apigw_invoke_url
  amplify_subdomain                = var.amplify_subdomain
  npm_token                        = var.npm_token
  env_vars_secret_key              = var.env_vars_secret_key
  tags                             = var.tags
}
