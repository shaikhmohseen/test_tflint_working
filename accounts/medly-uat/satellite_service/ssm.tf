resource "aws_ssm_parameter" "satellite_service_rest_api_id" {
  name        = "/${var.env}/satelliteServiceRestApiId"
  description = "The Satellite Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.satellite_service.api_gateway_id
}

resource "aws_ssm_parameter" "satellite_service_api_root_resource_id" {
  name        = "/${var.env}/satelliteServiceApiRootResourceId"
  description = "The Satellite Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.satellite_service.api_gateway_root_resource_id
}

resource "aws_ssm_parameter" "satellite_service_private_subnets" {
  name        = "/${var.env}/satelliteServicePrivateSubnets"
  description = "The List of Private Subnets in Satellite Sevice"
  type        = "StringList"
  value       = join(",", module.satellite_service.private_subnets_ids)
}

resource "aws_ssm_parameter" "satellite_service_vpc_id" {
  name        = "/${var.env}/satelliteServiceVpcId"
  description = "The Id of Satellite Sevice VPC"
  type        = "String"
  value       = module.satellite_service.vpc_id
}

resource "aws_ssm_parameter" "satellite_service_provisioned_concurrency" {
  name        = "/${var.env}/satelliteServiceProvisionedConcurrency"
  description = "The Satellite Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
