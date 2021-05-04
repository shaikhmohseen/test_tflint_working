variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "api_token_secret_key" {
  type        = string
  description = "Okta api token secret key"
}

variable "refresh_token_window_minutes" {
  type        = number
  default     = 10080
  description = "Okta refresh token window minutes"
}

variable "access_token_lifetime_minutes" {
  default     = 60
  type        = number
  description = "Access Token lifetime minutes"
}

variable "env_vars_secret_key" {
  type        = string
  description = "SSM Secret keys for ENV Variables in Code Build"
}

variable "okta_trusted_origin" {
  type        = string
  description = "Okta Trusted Origin"
}

variable "update_env_vars_secret" {
  type        = bool
  default     = false
  description = "Should the secret value be updated?"
}

variable "okta_app_scopes" {
  type        = list(string)
  description = "Scopes requested by app"
}

variable "okta_app_claims" {
  type = list(object({
    name   = string,
    scopes = string
  }))
  description = "Application claims against scopes requested"
}

variable "okta_app_custom_attributes" {
  type = list(object({
    name        = string,
    type        = string,
    displayName = string,
    required    = bool
  }))
  description = "Custom attributes needed by app"
}

variable "okta_app_custom_array_attributes" {
  type = list(object({
    name        = string,
    type        = string,
    arrayType   = string,
    displayName = string,
    required    = bool
  }))
  description = "Custom array attributes needed by app"
}

variable "okta_idp_name" {
  type        = string
  description = "Name of the IDP as created in okta"
}

variable "okta_idp_type" {
  type        = string
  description = "Type of the IDP. GOOGLE or MICROSOFT"
}

variable "okta_user_type" {
  type        = string
  description = "User type in okta. User/Consumer etc"
}

variable "okta_dev_login_and_logout_redirect_uris" {
  type        = list(string)
  default     = []
  description = "Additional branch specific urls for dev env"
}
