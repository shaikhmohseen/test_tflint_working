variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
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

variable "dev_terraform_state_bucket" {
  description = "s3 bucket where dev remote backend exist"
  type        = string
}

variable "dev_terraform_state_s3_module_key" {
  description = "s3 module object key"
  type        = string
}

variable "dev_aws_region" {
  description = "AWS Region where dev remote backend exist"
  type        = string
}

variable "dev_aws_profile" {
  description = "AWS creds profile on your local machine where dev remote backend exist"
  type        = string
}
