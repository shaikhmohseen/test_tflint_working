terraform {
  source = "../../..//modules/apps/insurance_app"
}

dependency "s3" {
  config_path = "../../medly-dev/s3/"
}

dependencies {
  paths = ["../okta_global_resources"]
}

inputs = {
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
  update_env_vars_secret     = true
  okta_idp_name              = "Insurance App Prod Azure SSO"
  okta_idp_type              = "MICROSOFT"
}

include {
  path = find_in_parent_folders()
}
