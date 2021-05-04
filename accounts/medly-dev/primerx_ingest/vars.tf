variable "deployment_account" {
  description = "Deployment Environment"
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
}

variable "pr_availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "pr_vpc_cidr_block" {
  description = "CIDR for VPC"
  type        = string
}

variable "pr_private_subnets" {
  description = "CIDR for private subnet vpc"
  type        = list(string)
}

variable "pr_public_subnets" {
  description = "CIDR for public subnet"
  type        = list(string)
}

variable "pr_ami_id" {
  description = "Ami id for primerx instance"
  type        = string
}

variable "pr_instance_type" {
  description = "instance type for primex instance"
  type        = string
}

variable "pr_key_name" {
  description = "Key name for primerx isntance"
  type        = string
}

variable "pr_allowed_cidr_blocks" {
  description = "allowed cidr blocks for instance"
  type        = list(string)
}

variable "pr_db_allowed_cidr_blocks" {
  type        = list(string)
  description = "allowed cidr blocks for instance"
}

variable "db_allowed_security_groups" {
  type        = list(string)
  description = "allowed security groups for instance"
  default     = []
}

variable "mmspy_eb_app_name" {
  type        = string
  description = "eb app name"
}

variable "mmspy_solution_stack_name" {
  type        = string
  description = "64bit Amazon Linux 2018.03 v2.20.3 running Multi-container Docker 19.03.6-ce (Generic)"
}

variable "mmspy_environment_type" {
  type        = string
  description = "env type"
}

variable "mmspy_aws_key_pair_name" {
  type        = string
  description = "name of keypair"
}

variable "mmspy_tier" {
  type        = string
  description = "mmspy tier type"
}

variable "mmspy_instance_type" {
  type        = string
  description = "instance type"
}

variable "mmspy_environment_variables" {
  type        = map(string)
  description = "env variable"
}

variable "ebp_version" {
  type        = string
  description = "eb version"
}

variable "ebp_name" {
  type        = string
  description = "eb name "
}

variable "ebp_ecr_image_tag_mutability" {
  type        = string
  description = "image tag mutability"
}