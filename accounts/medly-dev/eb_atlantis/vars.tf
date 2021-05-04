variable "service_name" {
  type        = string
  description = "Service Name"
}
variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "account_id" {
  description = "AWS accound id"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags for Prescription Service"
}

variable "vpc_cidr_block" {
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
  description = "Availability zone for subnets"
  type        = list(string)
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
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

variable "app_name" {
  type        = string
  description = "name of application"
}

variable "solution_stack_name" {
  type        = string
  description = "name of solution stack"
}

variable "environment_type" {
  type        = string
  description = "type of env"
}

variable "aws_key_pair_name" {
  type        = string
  description = "key pair name"
}

variable "tier" {
  type        = string
  description = "type of app"
}

variable "instance_type" {
  type        = string
  description = "type of instance"
}

variable "environment_variables" {
  type        = map(string)
  description = "env variable type"
}

variable "provisioned_concurrency_count" {
  default     = "0"
  type        = string
  description = "Lambda's provisiond concurrency count"
}
