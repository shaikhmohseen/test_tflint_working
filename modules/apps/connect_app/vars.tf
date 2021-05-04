variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Connect App"
  default     = {}
}

variable "update_env_vars_secret" {
  type        = bool
  default     = false
  description = "Should the secret value be updated?"
}

variable "okta_idp_name" {
  type        = string
  description = "Name of the IDP as created in okta"
}

variable "okta_idp_type" {
  type        = string
  description = "Type of the IDP. GOOGLE or MICROSOFT"
}

//specify only website address without paths eg https://ibd.dev-medly.io and not https://ibd.dev-medly.io/implicit/callback
variable "okta_dev_login_and_logout_redirect_uris" {
  type        = list(string)
  description = "Additional branch specific urls for dev env"
  default     = []
}
