variable "env" {
  description = "Deployment Environment"
  type        = string
}

variable "build_artifacts_bucket_arn" {
  description = "build assets s3 bucket arn"
  type        = string
}

variable "prescription_service_private_subnets_ids" {
  type        = list(string)
  description = "Subnets for the codebuild agent"
}

variable "prescription_service_vpc" {
  type        = string
  description = "VPC Id of prescription service"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Authoriser Service"
  default     = {}
}
