resource "aws_ssm_parameter" "partners_service_rest_api_id" {
  name        = "/${var.env}/partnersServiceRestApiId"
  description = "The Partners Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "partners_service_api_root_resource_id" {
  name        = "/${var.env}/partnersServiceApiRootResourceId"
  description = "The Partners Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "partners_service_private_subnets" {
  name        = "/${var.env}/partnersServicePrivateSubnets"
  description = "The List of Private Subnets in Partners Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "partners_service_vpc_id" {
  name        = "/${var.env}/partnersServiceVpcId"
  description = "The Id of Partners Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "partners_service_provisioned_concurrency" {
  name        = "/${var.env}/partnersServiceProvisionedConcurrency"
  description = "The Partners Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
