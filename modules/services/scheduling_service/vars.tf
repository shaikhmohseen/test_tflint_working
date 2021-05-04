variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "domain_name" {
  description = "Root domain name for the account chosen by aws profile"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "cidr_block" {
  description = "CIDR for dev VPC"
  type        = string
}

variable "private_subnets" {
  description = "CIDR for private subnet vpc"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "database_subnets" {
  type        = list(string)
  description = "A list all the database subnets in the VPC"
}

variable "availability_zones" {
  description = "CIDRs for subnets"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for rx-task-service Service"
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances in the VPC"
  default     = "default"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC"
  default     = true
}

variable "enable_http_endpoint" {
  type        = bool
  description = "Enable/Disable HTTP Endpoint for RDS"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

variable "db_rds_username" {
  description = "RDS username"
  type        = string

}

variable "db_rds_password" {
  description = "RDS password"
  type        = string

}

variable "db_rds_dbname" {
  description = "RDS Database Name"
  type        = string
}

variable "db_max_capacity" {
  default     = 2
  type        = number
  description = "Database Max Capacity"
}

variable "db_min_capacity" {
  default     = 2
  type        = number
  description = "Database Min Capacity"
}

variable "db_auto_pause" {
  default     = false
  description = "Database Auto Pause"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "bastion_aws_key_pair_name" {
  description = "Name of the AWS Key Pair to create"
  type        = string
}

variable "api_gateway_types" {
  type        = list(string)
  description = "API Gateway Endpoint Type (EDGE, Regional, Private)"
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

variable "enable_rds_secrets_rotation" {
  type        = bool
  description = "Boolean to decide whether to read from AWS Secret Manager or not."
}

variable "allow_rds_secret_access" {
  type        = bool
  description = "Allows codebuild to access rds secret"
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
