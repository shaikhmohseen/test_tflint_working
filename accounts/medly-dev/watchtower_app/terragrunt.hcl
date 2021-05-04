terraform {
  source = "../../..//modules/apps/watchtower_app"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn       = dependency.s3.outputs.build_artifacts_bucket_arn
  amplify_backend_apigw_invoke_url = "https://api-gw.dev-medly.io"
  amplify_github_enabled           = true
  deployment_account               = "medly-dev"
  okta_idp_name                    = "Google"
}

include {
  path = find_in_parent_folders()
}
