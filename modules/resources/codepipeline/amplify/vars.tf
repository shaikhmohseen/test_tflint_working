variable "service_name" {
  description = "Name of the product for which the CD configuration is created"
  type        = string
}

variable "env" {
  description = "Env for which this code pipeline is getting created"
  type        = string
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "build_artifacts_bucket_name" {
  description = "build assets s3 bucket name"
  type        = string
}
