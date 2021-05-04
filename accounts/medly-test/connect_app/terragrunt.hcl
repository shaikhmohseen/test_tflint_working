terraform {
  source = "../../..//modules/apps/connect_app"
}

dependencies {
  paths = ["../okta_global_resources"]
}

inputs = {
  build_artifacts_bucket_arn = "arn:aws:s3:::medly-dev-build-artifacts"
  update_env_vars_secret     = true
  okta_idp_name              = "Google"
  okta_idp_type              = "GOOGLE"
}

include {
  path = find_in_parent_folders()
}
