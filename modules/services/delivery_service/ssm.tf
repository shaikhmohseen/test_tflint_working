resource "aws_ssm_parameter" "delivery_service_rest_api_id" {
  name        = "/${var.env}/deliveryServiceRestApiId"
  description = "The Delivery Service Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "delivery_service_api_root_resource_id" {
  name        = "/${var.env}/deliveryServiceApiRootResourceId"
  description = "The Delivery Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "delivery_service_private_subnets" {
  name        = "/${var.env}/deliveryServicePrivateSubnets"
  description = "The List of Private Subnets in Delivery Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "delivery_service_vpc_id" {
  name        = "/${var.env}/deliveryServiceVpcId"
  description = "The Id of Delivery Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "delivery_service_provisioned_concurrency" {
  name        = "/${var.env}/deliveryServiceProvisionedConcurrency"
  description = "The Delivery Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "dp_uploads_bucket_arn" {
  name        = "/${var.env}/deliveryServiceUploadsS3BucketARN"
  description = "The ARN of the Delivery Service Uploads Bucket"
  type        = "String"
  value       = var.dp_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "dp_uploads_bucket_name" {
  name        = "/${var.env}/deliveryServiceUploadsS3BucketName"
  description = "The Name of the Delivery Service Uploads Bucket"
  type        = "String"
  value       = var.dp_uploads_s3_bucket_name
}
