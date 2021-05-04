resource "aws_ssm_parameter" "ibd_rest_api_id" {
  name        = "/${var.env}/ibdRestApiId"
  description = "The IBD Api Gateway Rest Api Id"
  type        = "String"
  value       = module.ibd.api_gateway_id
}

resource "aws_ssm_parameter" "ibd_api_root_resource_id" {
  name        = "/${var.env}/ibdApiRootResourceId"
  description = "The IBD Api Gateway Root Resource Id"
  type        = "String"
  value       = module.ibd.api_gateway_root_resource_id
}

resource "aws_ssm_parameter" "ibd_private_subnets" {
  name        = "/${var.env}/ibdPrivateSubnets"
  description = "The List of Private Subnets in IBD"
  type        = "StringList"
  value       = join(",", module.ibd.private_subnets_ids)
}

resource "aws_ssm_parameter" "ibd_vpc_id" {
  name        = "/${var.env}/ibdVpcId"
  description = "The Id of IBD VPC"
  type        = "String"
  value       = module.ibd.vpc_id
}

resource "aws_ssm_parameter" "ibd_uploads_bucket_arn" {
  name        = "/${var.env}/ibdUploadsS3BucketARN"
  description = "The ARN of the IBD Uploads Bucket"
  type        = "String"
  value       = module.ibd.uploads_s3_bucket_arn
}

