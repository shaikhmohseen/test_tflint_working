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