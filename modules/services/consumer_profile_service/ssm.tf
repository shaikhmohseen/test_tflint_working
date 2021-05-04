resource "aws_ssm_parameter" "consumer_profile_service_rest_api_id" {
  name        = "/${var.env}/consumerProfileServiceRestApiId"
  description = "The ${local.service_name} Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.api_gateway.id
}

resource "aws_ssm_parameter" "consumer_profile_service_api_root_resource_id" {
  name        = "/${var.env}/consumerProfileServiceApiRootResourceId"
  description = "The ${local.service_name} Api Gateway Root Resource Id"
  type        = "String"
  value       = module.api_gateway.root_resource_id
}

resource "aws_ssm_parameter" "consumer_profile_service_private_subnets" {
  name        = "/${var.env}/consumerProfileServicePrivateSubnets"
  description = "The List of Private Subnets in ${local.service_name}"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "consumer_profile_service_vpc_id" {
  name        = "/${var.env}/consumerProfileServiceVpcId"
  description = "The Id of ${local.service_name} VPC"
  type        = "String"
  value       = module.vpc.id
}

resource "aws_ssm_parameter" "consumer_profile_service_provisioned_concurrency" {
  name        = "/${var.env}/consumerProfileServiceProvisionedConcurrency"
  description = "The ${local.service_name} lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "consumer_profile_service_dynamodb_table_arn" {
  name        = "/${var.env}/consumerProfileServiceDynamoDbArn"
  description = "The ${local.service_name} Dynamo DB table Arn"
  type        = "String"
  value       = module.dynamodb_table.arn
}
