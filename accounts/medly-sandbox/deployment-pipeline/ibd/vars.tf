variable "deployment_account" {
  description = "Deployment Environment"
  default     = "medly-sandbox"
  type        = string
}

variable "service_name" {
  default     = "ibd"
  description = "Name of the product for which the CD configuration is created"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
  default     = "sandbox"
  type        = string
}

variable "aws_profile" {
  description = "AWS creds profile on your local machine"
  type        = string
  default     = "medly-sandbox"
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  default     = "us-east-1"
  type        = string
}

