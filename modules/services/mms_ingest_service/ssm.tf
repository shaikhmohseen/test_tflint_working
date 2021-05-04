resource "aws_ssm_parameter" "mms_ingest_service_rest_api_id" {
  name        = "/${var.env}/mmsIngestServiceRestApiId"
  description = "The MMS Ingest Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "mms_ingest_service_api_root_resource_id" {
  name        = "/${var.env}/mmsIngestServiceApiRootResourceId"
  description = "The MMS Ingest Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "mms_ingest_service_private_subnets" {
  name        = "/${var.env}/mmsIngestServicePrivateSubnets"
  description = "The List of Private Subnets in MMS Ingest Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "mms_ingest_service_vpc_id" {
  name        = "/${var.env}/mmsIngestServiceVpcId"
  description = "The Id of MMS Ingest Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "mms_ingest_service_provisioned_concurrency" {
  name        = "/${var.env}/mmsIngestServiceProvisionedConcurrency"
  description = "The Mms Ingest Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
