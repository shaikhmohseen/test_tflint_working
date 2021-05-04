resource "aws_ssm_parameter" "rx_ingestion_service_rest_api_id" {
  name        = "/${var.env}/rxIngestionServiceRestApiId"
  description = "The Rx Ingestion Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "rx_ingestion_service_api_root_resource_id" {
  name        = "/${var.env}/rxIngestionServiceApiRootResourceId"
  description = "The Rx Ingestion Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "rx_ingestion_service_private_subnets" {
  name        = "/${var.env}/rxIngestionServicePrivateSubnets"
  description = "The List of Private Subnets in Rx Ingestion Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "rx_ingestion_service_vpc_id" {
  name        = "/${var.env}/rxIngestionServiceVpcId"
  description = "The Id of Rx Ingestion Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "rx_ingestion_service_provisioned_concurrency" {
  name        = "/${var.env}/rxIngestionServiceProvisionedConcurrency"
  description = "The Rx Ingestion Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
