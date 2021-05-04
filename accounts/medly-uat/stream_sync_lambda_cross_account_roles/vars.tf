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

variable "sync_stream_lambda_execution_role_arn" {
  description = "aws arn of the deployment lambda (should be same for all account)"
  type        = string
}

variable "source_stream_arn_list" {
  description = "aws arn of the source stream"
  type        = list(string)
}

variable "service_name" {
  description = "Service name of the trigger deployment serverless stack"
  type        = string
}
