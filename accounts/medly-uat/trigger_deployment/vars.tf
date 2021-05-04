variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "lambda_account_arn" {
  description = "aws arn of the deployment lambda (should be same for all account)"
  type        = string
}

variable "service_name" {
  description = "Service name of the trigger deployment serverless stack"
  type        = string
}

variable "dev_build_artifacts_bucket_arn" {
  description = "ARN for s3 bucket used to store build artifacts in dev environment"
  type        = string
}
