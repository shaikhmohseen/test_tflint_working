resource "aws_ssm_parameter" "scheduling_service_rest_api_id" {
  name        = "/${var.env}/schedulingServiceRestApiId"
  description = "The Scheduling Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.scheduling_service.api_gateway_id
}

resource "aws_ssm_parameter" "scheduling_service_api_root_resource_id" {
  name        = "/${var.env}/schedulingServiceApiRootResourceId"
  description = "The Scheduling Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.scheduling_service.api_gateway_root_resource_id
}

resource "aws_ssm_parameter" "scheduling_service_private_subnets" {
  name        = "/${var.env}/schedulingServicePrivateSubnets"
  description = "The List of Private Subnets in Scheduling Service"
  type        = "StringList"
  value       = join(",", module.scheduling_service.private_subnets_ids)
}

resource "aws_ssm_parameter" "scheduling_service_vpc_id" {
  name        = "/${var.env}/schedulingServiceVpcId"
  description = "The Id of Scheduling Service VPC"
  type        = "String"
  value       = module.scheduling_service.vpc_id
}

resource "aws_ssm_parameter" "scheduling_service_provisioned_concurrency" {
  name        = "/${var.env}/schedulingServiceProvisionedConcurrency"
  description = "The Scheduling Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
