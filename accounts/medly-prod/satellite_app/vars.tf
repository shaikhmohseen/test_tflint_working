variable "deployment_account" {
  type        = string
  description = "Deployment Environment"
}

variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "env" {
  type        = string
  description = "Deployment Environment"
}

variable "domain_name" {
  description = "Domain name for the ibd app"
  type        = string
}

variable "amplify_github_enabled" {
  type        = bool
  description = "Is amplify app integrated with Github? For continuous deployments, set to true. For release to UAT and Prod, set to false"
}

variable "amplify_repository_url" {
  type        = string
  description = "Github URL of the code repository. Format: https://github.com/medlypharmacy/react-amplified"
}

variable "amplify_branch_patterns" {
  type        = string
  description = "Auto branch detection patterns. For e.g feature-*"
}

variable "amplify_subdomain" {
  type        = string
  description = "subdomain to access the frontend amplify app For e.g da if URL is da.dev-medly.io"
}

variable "amplify_backend_apigw_invoke_url" {
  type        = string
  description = "Invoke URL of a backend service API gateway. Amplify redirects API requests to this."
}

variable "env_vars_secret_key" {
  type        = string
  description = "SSM Secret keys for ENV Variables in Code Build"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "npm_token" {
  type        = string
  description = "NPM Token for amplify build"
}
