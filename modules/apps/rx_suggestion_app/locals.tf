locals {
  deployment_account     = "medly-${var.env}"
  service_name           = "rx-suggestion-app"
  amplify_github_enabled = (var.env == "prod" || var.env == "uat") ? false : true
  env_vars_secret_key    = "rx-suggestion-app-env"
}