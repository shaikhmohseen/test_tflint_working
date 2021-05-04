variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
}

variable "domain_name" {
  description = "Root domain name for the account chosen by aws profile"
  type        = string
}

variable "availability_zones" {
  description = "CIDRs for subnets"
}

variable "cidr_block" {
  description = "CIDR for Rx Task service VPC"
  type        = string
}

variable "private_subnets" {
  description = "CIDR for Rx Task service private subnet vpc"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs for Rx Task service public subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "CIDR for Rx Task service database subnet vpc"
  type        = list(string)
}

variable "rds_username" {
  description = "RDS username for Rx Task service"
  type        = string
}

variable "rds_password" {
  description = "RDS password for Rx Task service"
  type        = string
}

variable "rds_dbname" {
  description = "RDS Database Name for Rx Task service"
  type        = string
}

variable "rds_max_capacity" {
  type        = number
  description = "Database Max Capacity for Rx Task service"
}

variable "rds_min_capacity" {
  type        = number
  description = "Database Min Capacity for Rx Task service"
}

variable "rds_auto_pause" {
  type        = bool
  description = "Database Auto Pause for Rx Task service"
}

variable "bastion_aws_key_pair_name" {
  description = "Name of the AWS Key Pair to create"
  type        = string
}

variable "api_gateway_types" {
  type        = list(string)
  description = "API Gateway Endpoint Type (EDGE, Regional, Private)"
}

variable "service_name" {
  type        = string
  description = "service name"
}

variable "enable_rds_secrets_rotation" {
  type        = bool
  description = "Boolean to decide whether to read from AWS Secret Manager or not."
}

variable "enable_http_endpoint" {
  type        = bool
  description = "Enable/Disable HTTP Endpoint for RDS"
}

variable "allow_rds_secret_access" {
  type        = bool
  description = "Allows codebuild to access rds secret"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "scripts_s3_bucket_arn" {
  description = "S3 Bucket arn containing the shell scripts"
  type        = string
}

variable "bastion_public_keys_s3_bucket_arn" {
  description = "S3 Bucket arn containing the public keys"
  type        = string
}

variable "scripts_s3_bucket" {
  description = "S3 Bucket name containing the shell scripts"
  type        = string
}

variable "bastion_public_keys_s3_bucket" {
  description = "S3 Bucket name containing the public keys"
  type        = string
}

variable "provisioned_concurrency_count" {
  default     = "0"
  type        = string
  description = "Lambda's provisioned concurrency count"
}

variable "queue_name" {
  type        = string
  description = "queue name"
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
