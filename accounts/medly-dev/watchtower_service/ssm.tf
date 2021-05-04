resource "aws_ssm_parameter" "watchtower_service_rest_api_id" {
  name        = "/${var.env}/watchtowerServiceRestApiId"
  description = "The watchtower Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.watchtower_service.api_gateway_id
}

resource "aws_ssm_parameter" "watchtower_service_api_root_resource_id" {
  name        = "/${var.env}/watchtowerServiceApiRootResourceId"
  description = "The watchtower Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.watchtower_service.api_gateway_root_resource_id
}

resource "aws_ssm_parameter" "watchtower_service_private_subnets" {
  name        = "/${var.env}/watchtowerServicePrivateSubnets"
  description = "The List of Private Subnets in watchtower Sevice"
  type        = "StringList"
  value       = join(",", module.watchtower_service.private_subnets_ids)
}

resource "aws_ssm_parameter" "watchtower_service_vpc_id" {
  name        = "/${var.env}/watchtowerServiceVpcId"
  description = "The Id of watchtower Sevice VPC"
  type        = "String"
  value       = module.watchtower_service.vpc_id
}

resource "aws_ssm_parameter" "watchtower_service_provisioned_concurrency" {
  name        = "/${var.env}/watchtowerServiceProvisionedConcurrency"
  description = "The Watchtower Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
