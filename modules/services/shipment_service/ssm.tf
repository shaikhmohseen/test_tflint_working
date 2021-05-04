resource "aws_ssm_parameter" "shipment_service_rest_api_id" {
  name        = "/${var.env}/shipmentServiceRestApiId"
  description = "The Shipment Service API Gateway Rest API Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "shipment_service_api_root_resource_id" {
  name        = "/${var.env}/shipmentServiceApiRootResourceId"
  description = "The Shipment Service API Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "shipment_service_private_subnets" {
  name        = "/${var.env}/shipmentServicePrivateSubnets"
  description = "The List of Private Subnets of Shipment Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "shipment_service_vpc_id" {
  name        = "/${var.env}/shipmentServiceVpcId"
  description = "The Id of Shipment Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "shipment_service_provisioned_concurrency" {
  name        = "/${var.env}/shipmentServiceProvisionedConcurrency"
  description = "The Shipment Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
