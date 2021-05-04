terraform {
  source = "../../../modules/apps//delivery_hospital_app"
}

dependency "s3" {
  config_path = "../../medly-dev/s3/"
}

inputs = {
  build_artifacts_bucket_arn       = dependency.s3.outputs.build_artifacts_bucket_arn
  deployment_account               = "medly-prod"
  service_name                     = "delivery-hospital-app"
  aws_region                       = "us-east-1"
  domain_name                      = "medly.io"
  amplify_repository_url           = "https://github.com/medlypharmacy/delivery-hospital-app"
  amplify_github_enabled           = false
  amplify_branch_patterns          = "delivery-hospital-*,DELIVERY-HOSPITAL-*"
  amplify_subdomain                = "delivery-hospital"
  amplify_backend_apigw_invoke_url = "https://api-gw.medly.io"
  env_vars_secret_key              = "delivery-hospital-app-env"
  npm_token                        = ""
}

include {
  path = find_in_parent_folders()
}
