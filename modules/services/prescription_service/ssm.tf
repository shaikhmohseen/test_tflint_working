resource "aws_ssm_parameter" "prescription_service_rest_api_id" {
  name        = "/${var.env}/prescriptionServiceRestApiId"
  description = "The  Prescription Service Api Gateway Rest Api Id"
  type        = "String"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "prescription_service_api_root_resource_id" {
  name        = "/${var.env}/prescriptionServiceApiRootResourceId"
  description = "The Prescription Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "prescription_service_private_subnets" {
  name        = "/${var.env}/prescriptionServicePrivateSubnets"
  description = "The List of Private Subnets in Prescription Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "prescription_service_vpc_id" {
  name        = "/${var.env}/prescriptionServiceVpcId"
  description = "The Id of Prescription Service VPC"
  type        = "String"
  value       = module.vpc.id
}
resource "aws_ssm_parameter" "prescription_service_provisioned_concurrency" {
  name        = "/${var.env}/prescriptionServiceProvisionedConcurrency"
  description = "The Prescription Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
