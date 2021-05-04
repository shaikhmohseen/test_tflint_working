resource "aws_ssm_parameter" "onfleet_internal_service_rest_api_id" {
  name        = "/${var.env}/onfleetInternalServiceRestApiId"
  description = "The Onfleet Internal service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "onfleet_internal_service_api_root_resource_id" {
  name        = "/${var.env}/onfleetInternalServiceApiRootResourceId"
  description = "The Onfleet Internal service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "onfleet_internal_service_private_subnets" {
  name        = "/${var.env}/onfleetInternalServicePrivateSubnets"
  description = "The List of Private Subnets in Onfleet Internal service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "onfleet_internal_service_vpc_id" {
  name        = "/${var.env}/onfleetInternalServiceVpcId"
  description = "The Id of Onfleet Internal service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "onfleet_internal_service_provisioned_concurrency" {
  name        = "/${var.env}/onfleetInternalServiceProvisionedConcurrency"
  description = "The Onfleet Internal Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
