terraform {
  source = "../../..//modules/apps/px_app"
}

dependency "s3" {
  config_path = "../../medly-dev/s3/"
}

inputs = {
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
  update_env_vars_secret     = true
  okta_idp_name              = "PX App Prod Azure SSO"
  okta_idp_type              = "MICROSOFT"
}

include {
  path = find_in_parent_folders()
}
