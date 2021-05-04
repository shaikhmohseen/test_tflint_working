terraform {
  source = "../../..//modules/apps/watchtower_app"
}

dependency "s3" {
  config_path = "../../medly-dev/s3/"
}

inputs = {
  build_artifacts_bucket_arn       = dependency.s3.outputs.build_artifacts_bucket_arn
  amplify_github_enabled           = false
  amplify_backend_apigw_invoke_url = "https://api-gw.medly.io"
  deployment_account               = "medly-prod"
  okta_idp_name                    = "Google Identity Provider"
}
include {
  path = find_in_parent_folders()
}
