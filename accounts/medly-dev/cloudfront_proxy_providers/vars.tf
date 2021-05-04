variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "cname" {
  type        = string
  description = "Cname for the Cloudfront Distribution"
}

variable "cloudfront_log_bucket" {
  type        = string
  description = "Bucket for cloudfront logs"
}

variable "cloudfront_log_prefix" {
  type        = string
  description = "Cloudfront log prefix"
}

variable "tags" {
  description = "Tags for Cloudfront Proxy Providers"
  type        = map(string)
  default     = {}
}
