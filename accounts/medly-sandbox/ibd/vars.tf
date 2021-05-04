variable "aws_profile" {
  description = "AWS creds profile on your local machine"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
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

variable "domain_name" {
  description = "Domain name for the ibd app"
  type        = string
}

variable "cidr_block" {
  description = "CIDR for the IBD VPC"
  type        = string
}

variable "private_subnets" {
  description = "CIDR for IBD private subnet vpc"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs for IBD public subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "CIDR for IBD database subnet vpc"
  type        = list(string)
}

variable "rds_username" {
  description = "RDS username for IBD"
  type        = string
}

variable "rds_password" {
  description = "RDS password for IBD"
  type        = string
}

variable "rds_dbname" {
  description = "RDS Database Name for IBD"
  type        = string
}

variable "rds_max_capacity" {
  type        = number
  description = "Database Max Capacity for IBD"
}

variable "rds_min_capacity" {
  type        = number
  description = "Database Min Capacity for IBD"
}

variable "rds_auto_pause" {
  type        = bool
  description = "Database Auto Pause for IBD"
}

variable "amplify_github_enabled" {
  type        = bool
  description = "Is amplify app integrated wiith Github? For continuous deployments, set to true. For release to UAT and Prod, set to false"
}

variable "amplify_repository_url" {
  type        = string
  description = "Github URL of the code repository. Format: https://github.com/medlypharmacy/react-amplified"
}

variable "amplify_branch_patterns" {
  type        = string
  description = "Auto branch detection patterns. For e.g feature-*"
}