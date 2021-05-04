terraform {
  source = "../../..//modules/apps/connect_app"
}

dependency "s3" {
  config_path = "../s3"
}

dependencies {
  paths = ["../okta_global_resources"]
}

inputs = {
  build_artifacts_bucket_arn              = dependency.s3.outputs.build_artifacts_bucket_arn
  update_env_vars_secret                  = true
  okta_idp_name                           = "Google"
  okta_idp_type                           = "GOOGLE"
  okta_dev_login_and_logout_redirect_uris = ["http://localhost:8090"]
}

include {
  path = find_in_parent_folders()
}
