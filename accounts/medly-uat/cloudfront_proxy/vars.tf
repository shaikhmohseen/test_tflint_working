variable "aws_region" {
  description = "AWS Region for develop infra"
  type        = string
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}


variable "cloudfront_log_bucket" {
  type        = string
  description = "Bucket for cloudfront logs"
}

variable "cloudfront_log_prefix" {
  type        = string
  description = "Cloudfront log prefix"
}

variable "subdomain_internal" {
  type        = string
  description = "subdomain for the internal cloudfront distribution"
}

variable "subdomain_partners" {
  type        = string
  description = "subdomain for the partners cloudfront distribution"
}

variable "consumer_profile_service_api_gateway_base_url" {
  type        = string
  description = "API gateway base url for consumer-profile-service"
}

variable "partners_service_api_gateway_base_url" {
  type        = string
  description = "API gateway base URL for partners-service"
}
