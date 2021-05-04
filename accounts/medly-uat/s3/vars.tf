variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "deployment_account" {
  type = string
}

variable "env" {
  type = string
}

variable "ibd_domain_name" {
  type = string
}

variable "test_account_arn" {
  type        = list(string)
  description = "test account arn for allowing s3 access"
}

variable "root_account_id" {
  type        = string
  description = "ARN of root account ID."
}
