module "satellite_app" {
  source                           = "../../../modules/apps/satellite_app"
  service_name                     = var.service_name
  env                              = var.env
  deployment_account               = var.deployment_account
  aws_region                       = var.aws_region
  domain_name                      = var.domain_name
  build_artifacts_bucket_arn       = var.build_artifacts_bucket_arn
  amplify_repository_url           = var.amplify_repository_url
  amplify_github_enabled           = var.amplify_github_enabled
  amplify_branch_patterns          = var.amplify_branch_patterns
  amplify_subdomain                = var.amplify_subdomain
  amplify_backend_apigw_invoke_url = var.amplify_backend_apigw_invoke_url
  env_vars_secret_key              = var.env_vars_secret_key
  npm_token                        = var.npm_token
}