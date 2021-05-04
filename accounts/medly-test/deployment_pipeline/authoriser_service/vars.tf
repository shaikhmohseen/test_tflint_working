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

variable "build_artifacts_bucket_arn" {
  description = "build assets s3 bucket arn"
  type        = string
}

variable "build_artifacts_bucket_name" {
  description = "build assets s3 bucket name"
  type        = string
}
