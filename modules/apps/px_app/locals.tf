locals {
  deployment_account     = "medly-${var.env}"
  service_name           = "px-app"
  amplify_github_enabled = (var.env == "prod" || var.env == "uat") ? false : true
  env_vars_secret_key    = "px-app-env"
  amplify_subdomain      = "px"
  amplify_domain         = "${var.env == "prod" ? "" : "${var.env}-"}medly.${var.env == "prod" ? "com" : "io"}"
  okta_user_type         = "user"
  okta_app_claims        = []
  okta_app_scopes        = []
  okta_app_custom_attributes = [
    {
      name : "firstName",
      type : "string",
      displayName : "First Name",
      required : true
    },
    {
      name : "lastName",
      type : "string",
      displayName : "Last Name",
      required : true
    }
  ]
  okta_app_custom_array_attributes = [
    {
      name : "adminRights",
      type : "array",
      arrayType : "string",
      displayName : "Admin Rights",
      required : false
    },
    {
      name : "featurePreview",
      type : "array",
      arrayType : "string",
      displayName : "Feature Preview",
      required : false
    }
  ]
  okta_api_token_secret_key = "global/okta/secrets/terraform"
}
