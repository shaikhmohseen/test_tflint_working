resource "aws_ssm_parameter" "insurance_service_rest_api_id" {
  name        = "/${var.env}/insuranceServiceRestApiId"
  description = "The insurance Service Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "insurance_service_api_root_resource_id" {
  name        = "/${var.env}/insuranceServiceApiRootResourceId"
  description = "The insurance Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "insurance_service_private_subnets" {
  name        = "/${var.env}/insuranceServicePrivateSubnets"
  description = "The List of Private Subnets in insurance Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "insurance_service_vpc_id" {
  name        = "/${var.env}/insuranceServiceVpcId"
  description = "The Id of insurance Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "insurance_service_provisioned_concurrency" {
  name        = "/${var.env}/insuranceServiceProvisionedConcurrency"
  description = "The Insurance Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "ins_uploads_bucket_arn" {
  name        = "/${var.env}/insUploadsS3BucketARN"
  description = "The ARN of the Insurance Service Uploads Bucket"
  type        = "String"
  value       = var.ins_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "ins_uploads_bucket_name" {
  name        = "/${var.env}/insUploadsS3BucketName"
  description = "The Name of the Insurance Service Uploads Bucket"
  type        = "String"
  value       = var.ins_uploads_s3_bucket_name
}