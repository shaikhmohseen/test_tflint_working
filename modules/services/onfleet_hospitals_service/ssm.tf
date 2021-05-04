resource "aws_ssm_parameter" "onfleet_hospitals_service_rest_api_id" {
  name        = "/${var.env}/onfleetHospitalsServiceRestApiId"
  description = "The Onfleet Hospitals Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "onfleet_hospitals_service_api_root_resource_id" {
  name        = "/${var.env}/onfleetHospitalsServiceApiRootResourceId"
  description = "The Onfleet hospitals service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "onfleet_hospitals_service_private_subnets" {
  name        = "/${var.env}/onfleetHospitalsServicePrivateSubnets"
  description = "The List of Private Subnets in Onfleet hospitals service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "onfleet_hospitals_service_vpc_id" {
  name        = "/${var.env}/onfleetHospitalsServiceVpcId"
  description = "The Id of Onfleet hospitals service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "onfleet_hospitals_service_provisioned_concurrency" {
  name        = "/${var.env}/onfleetHospitalsServiceProvisionedConcurrency"
  description = "The Onfleet Hospitals Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
