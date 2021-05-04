resource "aws_ssm_parameter" "payment_service_rest_api_id" {
  name        = "/${var.env}/paymentServiceRestApiId"
  description = "The Payment Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "payment_service_api_root_resource_id" {
  name        = "/${var.env}/paymentServiceApiRootResourceId"
  description = "The Payment Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "payment_service_private_subnets" {
  name        = "/${var.env}/paymentServicePrivateSubnets"
  description = "The List of Private Subnets in Payment Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "payment_service_vpc_id" {
  name        = "/${var.env}/paymentServiceVpcId"
  description = "The Id of Payment Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "payment_service_provisioned_concurrency" {
  name        = "/${var.env}/paymentServiceProvisionedConcurrency"
  description = "The Payment Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
