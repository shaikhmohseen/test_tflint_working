variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
  default     = "us-east-1"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Shipment App"
  default     = {}
}
