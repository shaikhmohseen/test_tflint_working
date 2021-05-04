locals {
  deployment_account     = "medly-${var.env}"
  service_name           = "insurance-app"
  amplify_github_enabled = (var.env == "prod" || var.env == "uat") ? false : true
  env_vars_secret_key    = "insurance-app-env"
  amplify_subdomain      = "insurers"
  amplify_domain         = "${var.env == "prod" ? "" : "${var.env}-"}medly.${var.env == "prod" ? "com" : "io"}"

  okta_user_type = "user"
  okta_app_claims = [
    {
      name : "insuranceUser",
      scopes : "insuranceUser"
    },
    {
      name : "insuranceCompany",
      scopes : "insuranceCompany"
    },
    {
      name : "insuranceReportUpload",
      scopes : "insuranceReportUpload"
    },
    {
      name : "patient",
      scopes : "patient"
    }
  ]
  okta_app_scopes = [
    "insuranceUser",
    "insuranceCompany",
    "insuranceReportUpload",
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
      name : "insuranceUser",
      type : "array",
      arrayType : "string",
      displayName : "Insurance User",
      required : false
    },
    {
      name : "insuranceCompany",
      type : "array",
      arrayType : "string",
      displayName : "Insurance Company",
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
      name : "insuranceReportUpload",
      type : "array",
      arrayType : "string",
      displayName : "Insurance Report Upload",
      required : false
    }
  ]
  okta_api_token_secret_key = "global/okta/secrets/terraform"
}
