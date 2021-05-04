terraform {
  source = "../../../modules/apps//delivery_hospital_app"
}

inputs = {
  build_artifacts_bucket_arn       = "arn:aws:s3:::medly-dev-build-artifacts"
  deployment_account               = "medly-test"
  service_name                     = "delivery-hospital-app"
  aws_region                       = "us-east-1"
  domain_name                      = "test-medly.io"
  amplify_repository_url           = "https://github.com/medlypharmacy/delivery-hospital-app"
  amplify_github_enabled           = true
  amplify_branch_patterns          = "delivery-hospital-*,DELIVERY-HOSPITAL-*"
  amplify_subdomain                = "delivery-hospital"
  amplify_backend_apigw_invoke_url = "https://api-gw.test-medly.io"
  env_vars_secret_key              = "delivery-hospital-app-env"
  npm_token                        = ""
}

include {
  path = find_in_parent_folders()
}
