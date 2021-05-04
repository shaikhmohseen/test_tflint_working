variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN for s3 bucket with build artifacts"
}
