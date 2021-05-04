variable "deployment_account" {
  type        = string
  description = "Deployment Environment"
}

variable "env" {
  type        = string
  description = "The environment - dev/test/uat/prod/sandbox"
}

variable "next_env" {
  type        = string
  description = "Next environment to promote the artifacts after successful execution(plan & apply)"
  default     = null
}

variable "next_env_build_artifacts_bucket_name" {
  description = "build assets s3 bucket name to promote artifact"
  type        = string
  default     = null
}

variable "next_env_build_artifacts_bucket_arn" {
  description = "build artifacts bucket arn to promote artifact"
  type        = string
  default     = null
}

variable "artifact_type" {
  type    = string
  default = "CODEPIPELINE"
}

variable "source_type" {
  type    = string
  default = "CODEPIPELINE"
}

variable "compute_type" {
  type    = string
  default = "BUILD_GENERAL1_MEDIUM"
}

variable "image" {
  type    = string
  default = "aws/codebuild/standard:5.0"
}

variable "privileged_mode" {
  type    = string
  default = true
}

variable "type" {
  type    = string
  default = "LINUX_CONTAINER"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "build artifacts bucket arn"
}

variable "terraform_version" {
  type        = string
  description = "Terraform Version"
  default     = "0.14.6"
}

variable "terragrunt_version" {
  type        = string
  description = "Terragrunt Version"
  default     = "v0.28.7"
}

variable "build_artifacts_bucket_name" {
  description = "build assets s3 bucket name"
  type        = string
}

variable "github_enabled" {
  description = "Codepipeline source is Github"
  type        = bool
}

variable "source_github_repository_name" {
  description = "Name for the repository that is used as source for this codepipeline"
  type        = string
}

variable "env_directory" {
  description = "`terragrunt run-all` commands will be executed in this directory"
  type        = string
}
