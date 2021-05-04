resource "aws_ssm_parameter" "delivery_hospitals_service_rest_api_id" {
  name        = "/${var.env}/deliveryHospitalsServiceRestApiId"
  description = "The delivery_hospitals Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "delivery_hospitals_service_api_root_resource_id" {
  name        = "/${var.env}/deliveryHospitalsServiceApiRootResourceId"
  description = "The delivery_hospitals Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "delivery_hospitals_service_private_subnets" {
  name        = "/${var.env}/deliveryHospitalsServicePrivateSubnets"
  description = "The List of Private Subnets in delivery_hospitals Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "delivery_hospitals_service_vpc_id" {
  name        = "/${var.env}/deliveryHospitalsServiceVpcId"
  description = "The Id of delivery_hospitals Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "delivery_hospitals_service_provisioned_concurrency" {
  name        = "/${var.env}/deliveryHospitalsServiceProvisionedConcurrency"
  description = "The Delivery Hospitals Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "delivery_hospitals_service_uploads_bucket_arn" {
  name        = "/${var.env}/deliveryHospitalsServiceUploadsS3BucketARN"
  description = "The ARN of the Delivery Hospitals Service Uploads Bucket"
  type        = "String"
  value       = var.dph_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "delivery_hospitals_service_uploads_bucket_name" {
  name        = "/${var.env}/deliveryHospitalsServiceUploadsS3BucketName"
  description = "The Name of the Delivery Hospitals Service Uploads Bucket"
  type        = "String"
  value       = var.dph_uploads_s3_bucket_name
}
