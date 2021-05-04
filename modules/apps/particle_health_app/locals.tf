locals {
  deployment_account     = "medly-${var.env}"
  service_name           = "particle-health-app"
  amplify_github_enabled = (var.env == "prod" || var.env == "uat") ? false : true
  env_vars_secret_key    = "particle-health-app-env"
}
