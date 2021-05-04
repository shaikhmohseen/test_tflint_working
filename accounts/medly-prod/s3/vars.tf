variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "deployment_account" {
  type        = string
  description = "Deployment account"
}

variable "env" {
  type        = string
  description = "ENV for s3 bucket"
}

variable "ibd_domain_name" {
  type        = string
  description = "Domain name for ibd"
}

variable "uat_account_arn" {
  type        = list(string)
  description = "UAT account arn for allowing s3 access"
}

variable "root_account_id" {
  type        = string
  description = "ARN of root account ID."
}
