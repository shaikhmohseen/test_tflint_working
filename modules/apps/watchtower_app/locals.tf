locals {
  service_name              = "watchtower-app"
  aws_region                = "us-east-1"
  amplify_repository_url    = "https://github.com/medlypharmacy/watchtower-app"
  amplify_branch_patterns   = "watch-*,WATCH-*"
  amplify_subdomain         = "watchtower"
  amplify_domain            = "${var.env == "prod" ? "" : "${var.env}-"}medly.io"
  npm_token                 = ""
  env_vars_secret_key       = "watchtower-app-env"
  okta_api_token_secret_key = "global/okta/secrets/terraform"
  update_env_vars_secret    = true
  okta_idp_type             = "GOOGLE"
  okta_app_scopes           = ["watchtower"]
  okta_app_claims = [{
    name : "watchtowerEnvs",
    scopes : "watchtower"
    },
    {
      name : "watchtowerApps",
      scopes : "watchtower"
  }]
  okta_app_custom_attributes = [{
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
  }]
  okta_app_custom_array_attributes = [{
    name : "adminRights",
    type : "array",
    arrayType : "string",
    displayName : "Admin Rights",
    required : false
  }]
  okta_user_type = "user"
}
