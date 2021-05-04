variable "deployment_account" {
  description = "Deployment Environment"
  type        = string
}

variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "aws_profile" {
  description = "AWS creds profile on your local machine"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}