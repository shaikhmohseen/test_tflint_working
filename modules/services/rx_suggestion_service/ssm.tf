resource "aws_ssm_parameter" "rx_suggestion_service_rest_api_id" {
  name        = "/${var.env}/rxSuggestionServiceRestApiId"
  description = "The Rx Suggestion Service API Gateway Rest API Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "rx_suggestion_service_api_root_resource_id" {
  name        = "/${var.env}/rxSuggestionServiceApiRootResourceId"
  description = "The Rx Suggestion Service API Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "rx_suggestion_service_private_subnets" {
  name        = "/${var.env}/rxSuggestionServicePrivateSubnets"
  description = "The List of Private Subnets of Rx Suggestion Service"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "rx_suggestion_service_vpc_id" {
  name        = "/${var.env}/rxSuggestionServiceVpcId"
  description = "The Id of Rx Suggestion Service VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "rx_suggestion_service_provisioned_concurrency" {
  name        = "/${var.env}/rxSuggestionServiceProvisionedConcurrency"
  description = "The Rx Suggestion Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}
