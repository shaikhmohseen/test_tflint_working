variable "provisioned_concurrency_count" {
  default     = "0"
  type        = string
  description = "Lambda's provisiond concurrency count"
}

variable "aws_account_ids" {
  description = "AWS account ids which could access s3 artifacts bucket"
  type = object({
    test = string
    uat  = string
    prod = string
  })
}

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
