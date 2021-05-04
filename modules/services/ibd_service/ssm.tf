resource "aws_ssm_parameter" "ibd_rest_api_id" {
  name        = "/${var.env}/ibdServiceRestApiId"
  description = "The IBD Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "ibd_api_root_resource_id" {
  name        = "/${var.env}/ibdServiceApiRootResourceId"
  description = "The IBD Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "ibd_private_subnets" {
  name        = "/${var.env}/ibdServicePrivateSubnets"
  description = "The List of Private Subnets in IBD"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "ibd_vpc_id" {
  name        = "/${var.env}/ibdServiceVpcId"
  description = "The Id of IBD VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "ibd_uploads_bucket_arn" {
  name        = "/${var.env}/ibdServiceUploadsS3BucketARN"
  description = "The ARN of the IBD Uploads Bucket"
  type        = "String"
  value       = var.ibd_uploads_s3_bucket_arn
}

resource "aws_ssm_parameter" "ibd_service_provisioned_concurrency" {
  name        = "/${var.env}/ibdServiceProvisionedConcurrency"
  description = "The Ibd Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
