variable "deployment_account" {
  description = "Deployment Environment"
  default     = "medly-sandbox"
}

variable "aws_profile" {
  description = "AWS creds profile on your local machine"
  default     = "medly-sandbox"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  default     = "us-east-1"
  type        = string
}

variable "key_name" {
  description = "key pair for instance"
  type        = string
  default     = "cxd-json-server-sandbox"
}

variable "env" {
  description = "Deployment Environment"
  default     = "sandbox"
}

variable "availability_zones" {
  description = "CIDRs for subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instace_type" {
  description = "Type of instance"
  default     = "t2.micro"
}

variable "tags" {
  type        = map(string)
  description = "tags for resources"
  default = {
    app = "cxd-json-server"
  }
}

variable "app_port" {
  description = "default port for application in security group"
  type        = number
  default     = 4000
}

variable "allowed_cidr_blocks" {
  description = "allowed cidr blocks"
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ami for instance default ubunutu 18.04"
  type        = string
  default     = "ami-085925f297f89fce1"
}
