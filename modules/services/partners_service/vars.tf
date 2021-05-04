variable "deployment_account" {
  type        = string
  description = "Deployment Environment"
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "cidr_block" {
  description = "CIDR for VPC"
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

variable "availability_zones" {
  description = "CIDRs for  subnets"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for Partners Service"
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

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

variable "build_artifacts_bucket_arn" {
  type        = string
  description = "ARN of the bucket that contains build assets for deployments"
}

variable "api_gateway_types" {
  type        = list(string)
  description = "API Gateway Endpoint Type (EDGE, Regional, Private)"
}

variable "users_table_name" {
  description = "DynamoDB users table name"
  type        = string
  default     = "partners-service.users"
}

variable "cache_table_name" {
  description = "DynamoDB cache table name"
  type        = string
  default     = "partners-service.cache"
}

variable "dynamodb_read_capacity" {
  description = "DynamoDB read capacity"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "DynamoDB write capacity"
  type        = number
  default     = 5
}

variable "users_table_attributes" {
  description = "Users table default attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "api_key"
      type = "S"
  }]
}

variable "cache_table_attributes" {
  description = "Cache table default attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "cache_key"
      type = "S"
    }
  ]
}

variable "users_table_hash_key" {
  description = "Users table default hash key"
  type        = string
  default     = "api_key"
}

variable "cache_table_hash_key" {
  description = "Cache table default hash key"
  type        = string
  default     = "cache_key"
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

variable "provisioned_concurrency_count" {
  default     = "0"
  type        = string
  description = "Lambda's provisioned concurrency count"
}

variable "build_artifacts_bucket_name" {
  description = "build assets s3 bucket name"
  type        = string
}
