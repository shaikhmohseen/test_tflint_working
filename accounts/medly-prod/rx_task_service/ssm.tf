resource "aws_ssm_parameter" "rx_task_service_rest_api_id" {
  name        = "/${var.env}/rxTaskServiceRestApiId"
  description = "The Delivery Service Api Gateway Rest Api Id"
  type        = "String"
  overwrite   = "true"
  value       = module.rx_task_service.api_gateway_id
}

resource "aws_ssm_parameter" "rx_task_service_api_root_resource_id" {
  name        = "/${var.env}/rxTaskServiceApiRootResourceId"
  description = "The Delivery Service Api Gateway Root Resource Id"
  type        = "String"
  value       = module.rx_task_service.api_gateway_root_resource_id
}

resource "aws_ssm_parameter" "rx_task_service_private_subnets" {
  name        = "/${var.env}/rxTaskServicePrivateSubnets"
  description = "The List of Private Subnets in Delivery Service"
  type        = "StringList"
  value       = join(",", module.rx_task_service.private_subnets_ids)
}

resource "aws_ssm_parameter" "rx_task_service_vpc_id" {
  name        = "/${var.env}/rxTaskServiceVpcId"
  description = "The Id of Delivery Service VPC"
  type        = "String"
  value       = module.rx_task_service.vpc_id
}

resource "aws_ssm_parameter" "rx_task_service_provisioned_concurrency" {
  name        = "/${var.env}/rxTaskServiceProvisionedConcurrency"
  description = "The Rx Task Service lambda's provisioned concurrency count"
  type        = "String"
  value       = var.provisioned_concurrency_count
}

resource "aws_ssm_parameter" "rx_task_service_mobile_scheduling_queue_arn" {
  name        = "/px/rxtask-service/arn/mobile-notification-queue"
  description = "The arn of the rx task service mobile notification queue"
  type        = "String"
  value       = module.rx_task_service.queue_arn
}

resource "aws_ssm_parameter" "rx_task_service_mobile_scheduling_queue_url" {
  name        = "/px/rxtask-service/url/mobile-notification-queue"
  description = "The url of the rx task service mobile notification queue"
  type        = "String"
  value       = module.rx_task_service.queue_id
}
