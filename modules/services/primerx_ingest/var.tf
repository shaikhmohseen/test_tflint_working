variable "service_name" {
  type        = string
  description = "Service Name"
  default     = "primerx-ingest"
}
variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
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
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "pr_availability_zones" {
  description = "Availability zone for subnets"
  type        = list(string)
}

variable "tags" {
  type = map(string)
  default = {
    Name = "primerx-ingest"
  }
  description = "Tags for Prescription Service"
}

variable "mmspy_tags" {
  type = map(string)
  default = {
    env     = "mmspy"
    service = "primerx-ingest"
  }
  description = "Tags for Prescription Service"
}

variable "pr_enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC"
  default     = true
}

variable "pr_enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC"
  default     = true
}

variable "pr_enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

variable "pr_ami_id" {
  type        = string
  description = "AMI for primerx instance"
}

variable "pr_instance_type" {
  type        = string
  description = "instance type for primex instance"

}

variable "pr_key_name" {
  type        = string
  description = "Key name for primerx instance"
}

variable "pr_instance_port" {
  type        = number
  default     = 3389
  description = "port number for primerx instance"
}

variable "pr_db_instance_port" {
  type        = number
  default     = 1433
  description = "port number for primerx instance"
}

variable "pr_allowed_cidr_blocks" {
  type        = list(string)
  description = "allowed cidr blocks for instance"
  default     = []
}

variable "db_allowed_security_groups" {
  type        = list(string)
  description = "allowed security groups for instance"
  default     = []
}

variable "pr_db_allowed_cidr_blocks" {
  type        = list(string)
  description = "allowed cidr blocks for instance"
}

variable "mmspy_eb_app_name" {
  type        = string
  description = "name of application"
}

variable "mmspy_solution_stack_name" {
  type        = string
  description = "name of solution stack"
}

variable "mmspy_environment_type" {
  type        = string
  description = "type of env"
}

variable "mmspy_aws_key_pair_name" {
  type        = string
  description = "key pair name"
}

variable "mmspy_tier" {
  type        = string
  description = "type of app"
}

variable "mmspy_instance_type" {
  type        = string
  description = "type of instance"
}

variable "mmspy_environment_variables" {
  type        = map(string)
  description = "env variable type"
}

variable "ebp_version" {
  type        = string
  description = "eb version"
}

variable "ebp_name" {
  type        = string
  description = "eb name"
}

variable "ebp_ecr_image_tag_mutability" {
  type        = string
  description = "image tag"
}