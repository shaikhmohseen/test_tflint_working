variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
}

variable "service_name" {
  description = "Name of the product for which the CD configuration is created"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_profile" {
  description = "AWS creds profile on your local machine"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "dev_build_artifacts_bucket_arn" {
  description = "ARN for s3 bucket used to store build artifacts in dev environment"
  type        = string
}

variable "dev_build_artifacts_bucket_name" {
  description = "Name for s3 bucket used to store build artifacts in dev environment"
  type        = string
}
