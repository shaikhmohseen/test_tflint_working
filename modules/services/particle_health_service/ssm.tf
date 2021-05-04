resource "aws_ssm_parameter" "particle_health_service_rest_api_id" {
  name        = "/${var.env}/particleHealthServiceRestApiId"
  description = "The Particle Health Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "particle_health_service_api_root_resource_id" {
  name        = "/${var.env}/particleHealthServiceApiRootResourceId"
  description = "The Particle Health Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "particle_health_service_private_subnets" {
  name        = "/${var.env}/particleHealthServicePrivateSubnets"
  description = "The List of Private Subnets in Particle Health Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "particle_health_service_vpc_id" {
  name        = "/${var.env}/particleHealthServiceVpcId"
  description = "The Id of Particle Health Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "ph_uploads_bucket_arn" {
  name        = "/${var.env}/phsUploadsS3BucketARN"
  description = "The ARN of the Particle Health Uploads Bucket"
  type        = "String"
  value       = var.ph_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "ph_uploads_bucket_name" {
  name        = "/${var.env}/phsUploadsS3BucketName"
  description = "The Name of the Particle Health Uploads Bucket"
  type        = "String"
  value       = var.ph_uploads_s3_bucket_name
}

resource "aws_ssm_parameter" "particle_health_service_provisioned_concurrency" {
  name        = "/${var.env}/particleHealthServiceProvisionedConcurrency"
  description = "The Particle Health Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
