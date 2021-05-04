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

variable "dev_build_artifacts_bucket_name" {
  type        = string
  description = "S3 Bucket name in dev env for build artifacts"
}

variable "dev_build_artifacts_bucket_arn" {
  type        = string
  description = "ARN for s3 bucket with build artifacts in dev environment"
}
