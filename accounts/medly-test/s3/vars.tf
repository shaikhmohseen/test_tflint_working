variable "deployment_account" {
  type = string
}

variable "env" {
  type = string
}

variable "ibd_domain_name" {
  type = string
}

variable "dev_account_arn" {
  type        = list(string)
  description = "dev account arn for allowing s3 access"
}

variable "root_account_id" {
  type        = string
  description = "ARN of root account ID."
}
