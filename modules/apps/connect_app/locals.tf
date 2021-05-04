locals {
  deployment_account     = "medly-${var.env}"
  service_name           = "connect-app"
  amplify_github_enabled = (var.env == "prod" || var.env == "uat") ? false : true
  env_vars_secret_key    = "connect-app-env"
  amplify_subdomain      = "connect"
  amplify_domain         = "${var.env == "prod" ? "" : "${var.env}-"}medly.${var.env == "prod" ? "com" : "io"}"

  okta_user_type = "user"
  okta_app_claims = [
    {
      name : "prescription",
      scopes : "prescription"
    },
    {
      name : "facility",
      scopes : "facility"
    },
    {
      name : "patient",
      scopes : "patient"
    },
    {
      name : "provider",
      scopes : "provider"
    },
    {
      name : "accountManager",
      scopes : "accountManager"
    }
  ]
  okta_app_scopes = [
    "facility",
    "prescription",
    "accountManager",
    "provider",
    "patient"
  ]
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
      name : "prescription",
      type : "array",
      arrayType : "string",
      displayName : "Prescription",
      required : false
    },
    {
      name : "facility",
      type : "array",
      arrayType : "string",
      displayName : "Facility",
      required : false
    },
    {
      name : "patient",
      type : "array",
      arrayType : "string",
      displayName : "Patient",
      required : false
    },
    {
      name : "provider",
      type : "array",
      arrayType : "string",
      displayName : "Provider",
      required : false
    },
    {
      name : "accountManager",
      type : "array",
      arrayType : "string",
      displayName : "Account Manager",
      required : false
    }
  ]
  okta_api_token_secret_key = "global/okta/secrets/terraform"
}
