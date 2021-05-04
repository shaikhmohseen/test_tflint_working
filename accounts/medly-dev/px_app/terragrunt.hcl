terraform {
  source = "../../..//modules/apps/px_app"
}

dependency "s3" {
  config_path = "../s3"
}

dependencies {
  paths = ["../okta_global_resources"]
}

inputs = {
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
  update_env_vars_secret     = true
  okta_idp_name              = "Google"
  okta_idp_type              = "GOOGLE"
  okta_dev_login_and_logout_redirect_uris = [
    "http://localhost:8000",
    "https://px-341-square-application-id.dev-medly.io/",
    "https://px-697.dev-medly.io/",
    "https://px-698-boerboom-wip.dev-medly.io/",
    "https://px-698-edit-task.dev-medly.io/",
    "https://px-746-finish-up.dev-medly.io/",
    "https://px-746-ui-fixes.dev-medly.io/",
    "https://px-827-patient-name-spaces.dev-medly.io/",
    "https://px-831.dev-medly.io/",
    "https://px-882-hydrate-ui-with-existing-task-data.dev-medly.io/",
    "https://px-882-payment-hydrate.dev-medly.io/",
    "https://px-901.dev-medly.io/",
    "https://px-905.dev-medly.io/",
    "https://px-913.dev-medly.io/",
    "https://px-921-button-payment-condition.dev-medly.io/",
    "https://px-928-931.dev-medly.io/",
    "https://px-954.dev-medly.io/",
    "https://px-amplify-custom-domain.dev-medly.io/"
  ]
}

include {
  path = find_in_parent_folders()
}
