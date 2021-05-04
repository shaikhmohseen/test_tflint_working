resource "aws_ssm_parameter" "patient_service_rest_api_id" {
  name        = "/${var.env}/patientServiceRestApiId"
  description = "The Patient Service Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "patient_service_api_root_resource_id" {
  name        = "/${var.env}/patientServiceApiRootResourceId"
  description = "The Patient Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "patient_service_private_subnets" {
  name        = "/${var.env}/patientServicePrivateSubnets"
  description = "The List of Private Subnets in Patient Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "patient_service_vpc_id" {
  name        = "/${var.env}/patientServiceVpcId"
  description = "The Id of Patient Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "patient_service_provisioned_concurrency" {
  name        = "/${var.env}/patientServiceProvisionedConcurrency"
  description = "The Patient Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
