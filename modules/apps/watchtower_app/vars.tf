variable "deployment_account" {
  type        = string
  description = "Deployment Environment"
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "amplify_github_enabled" {
  type        = bool
  description = "Is amplify integrated with Github? For continuous deployments, set to true. For releases to UAT and Prod, set to false"
}

variable "amplify_backend_apigw_invoke_url" {
  type        = string
  description = "Invoke URL of a backend service API gateway. Amplify redirects API requests to this."
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Watchtower App"
  default     = {}
}

//specify only website address without paths eg https://ibd.dev-medly.io and not https://ibd.dev-medly.io/implicit/callback
variable "okta_dev_login_and_logout_redirect_uris" {
  type        = list(string)
  description = "Additional branch specific urls for dev env"
  default     = []
}

variable "okta_idp_name" {
  type        = string
  description = "Okta IDP name"
}
