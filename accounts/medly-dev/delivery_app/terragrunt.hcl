terraform {
  source = "../../../modules/apps//delivery_app"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn       = dependency.s3.outputs.build_artifacts_bucket_arn
  service_name                     = "delivery-app"
  deployment_account               = "medly-dev"
  aws_region                       = "us-east-1"
  domain_name                      = "dev-medly.io"
  amplify_repository_url           = "https://github.com/medlypharmacy/delivery-app"
  amplify_github_enabled           = true
  amplify_branch_patterns          = "del-*,DEL-*"
  amplify_subdomain                = "delivery"
  amplify_backend_apigw_invoke_url = "https://api-gw.dev-medly.io"
  env_vars_secret_key              = "delivery-app-env"
  npm_token                        = ""
}

include {
  path = find_in_parent_folders()
}
