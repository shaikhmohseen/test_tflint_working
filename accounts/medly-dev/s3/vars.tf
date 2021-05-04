variable "deployment_account" {
  type = string
}

variable "env" {
  type = string
}

variable "ibd_domain_name" {
  type = string
}

variable "root_account_id" {
  type        = string
  description = "ARN of root account ID."
}

variable "aws_account_ids" {
  description = "AWS account ids which could access s3 artifacts bucket"
  type = object({
    test           = string
    uat            = string
    prod           = string
    sandbox        = string
    data_dev       = string
    data_uat       = string
    data_prod      = string
    root           = string
    security_tools = string
    log_archive    = string
  })
}

variable "lambda_arns" {
  description = "AWS Lambda ARNs which could access s3 artifacts bucket"
  type = object({
    watchtower_arn = string
  })
}
