variable "allow_cross_account_access" {
  description = "allow access from other accounts"
  default     = false
}

variable "namespace" {
  description = "Namespace for this module, can be name of the company or product"
  type        = string
}

variable "env" {
  description = "Medly env"
  type        = string
}

variable "aws_account_ids" {
  description = "AWS account ids which could access the terraform state bucket"
  type        = list(string)
}
