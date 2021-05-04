variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
  default     = "us-east-1"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "okta_idp_name" {
  type        = string
  description = "Name of the IDP as created in okta"
}

variable "okta_idp_type" {
  type        = string
  description = "Type of the IDP. GOOGLE or MICROSOFT"
}

variable "update_env_vars_secret" {
  type        = bool
  default     = false
  description = "Should the secret value be updated?"
}

//specify only website address without paths eg https://ibd.dev-medly.io and not https://ibd.dev-medly.io/implicit/callback
variable "okta_dev_login_and_logout_redirect_uris" {
  type        = list(string)
  description = "Additional branch specific urls for dev env"
  default     = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for PX App"
}
