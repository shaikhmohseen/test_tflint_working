variable "aws_region" {
  description = "AWS Region for infra"
  type        = string
}

variable "deployment_account" {
  description = "Deployment Environment"
}

variable "env" {
  description = "Deployment Environment"
}

variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "availability_zones" {
  description = "CIDRs for subnets"
}

variable "cidr_block" {
  description = "CIDR for the Satellite Sevice VPC"
  type        = string
}

variable "private_subnets" {
  description = "CIDR for Satellite Sevice private subnet vpc"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs for Satellite Sevice public subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "CIDR for Satellite Sevice database subnet vpc"
  type        = list(string)
}

variable "api_gateway_types" {
  type        = list(string)
  description = "API Gateway Endpoint Type (EDGE, Regional, Private)"
}

variable "provisioned_concurrency_count" {
  default     = "0"
  type        = string
  description = "Lambda's provisiond concurrency count"
}

variable "dev_build_artifacts_bucket_arn" {
  type        = string
  description = "ARN for s3 bucket with build artifacts in dev environment"
}

variable "enable_api_gw_logging" {
  type        = bool
  default     = false
  description = "Flag to enable/disable API Gateway logging."
}

variable "api_gw_logging_level" {
  type        = string
  default     = "ERROR"
  description = "Specifies the logging level for this method, which effects the log entries pushed to Amazon CloudWatch Logs. The available levels are OFF, ERROR, and INFO."
}
