resource "aws_ssm_parameter" "facility_service_rest_api_id" {
  name        = "/${var.env}/facilityServiceRestApiId"
  description = "The Facility Service Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "facility_service_api_root_resource_id" {
  name        = "/${var.env}/facilityServiceApiRootResourceId"
  description = "The Facility Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "facility_service_private_subnets" {
  name        = "/${var.env}/facilityServicePrivateSubnets"
  description = "The List of Private Subnets in Facility Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "facility_service_vpc_id" {
  name        = "/${var.env}/facilityServiceVpcId"
  description = "The Id of Facility Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "facility_service_provisioned_concurrency" {
  name        = "/${var.env}/facilityServiceProvisionedConcurrency"
  description = "The Facility Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "fs_uploads_bucket_arn" {
  name        = "/${var.env}/fsUploadsS3BucketARN"
  description = "The ARN of the Facility Service Uploads Bucket"
  type        = "String"
  value       = var.fs_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "fs_uploads_bucket_name" {
  name        = "/${var.env}/fsUploadsS3BucketName"
  description = "The Name of the Facility Service Uploads Bucket"
  type        = "String"
  value       = var.fs_uploads_s3_bucket_name
}
