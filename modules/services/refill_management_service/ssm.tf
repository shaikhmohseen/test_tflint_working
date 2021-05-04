resource "aws_ssm_parameter" "refill_management_service_rest_api_id" {
  name        = "/${var.env}/refillManagementServiceRestApiId"
  description = "The Refill Management Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "refill_management_service_api_root_resource_id" {
  name        = "/${var.env}/refillManagementServiceApiRootResourceId"
  description = "The Refill Management Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "refill_management_service_private_subnets" {
  name        = "/${var.env}/refillManagementServicePrivateSubnets"
  description = "The List of Private Subnets of Refill Management Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "refill_management_service_vpc_id" {
  name        = "/${var.env}/refillManagementServiceVpcId"
  description = "The Id of Refill Management Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "refill_management_service_provisioned_concurrency" {
  name        = "/${var.env}/refillManagementServiceProvisionedConcurrency"
  description = "The Refill Management Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "refill_management_service_uploads_bucket_arn" {
  name        = "/${var.env}/rmsUploadsS3BucketARN"
  description = "The ARN of the Refill Management Service Uploads Bucket"
  type        = "String"
  value       = var.rms_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "refill_management_service_uploads_bucket_name" {
  name        = "/${var.env}/rmsUploadsS3BucketName"
  description = "The Name of the Refill Management Service Uploads Bucket"
  type        = "String"
  value       = var.rms_uploads_s3_bucket_name
}

resource "aws_ssm_parameter" "refill_management_service_report_sender_email" {
  name        = "/${var.env}/rmsReportSenderEmail"
  description = "The Name of the Refill Management Service Report Sender Email"
  type        = "String"
  value       = var.rms_report_sender_email
}
