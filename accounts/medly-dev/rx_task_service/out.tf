output "rx_task_service_cidr_block" {
  value = module.rx_task_service.cidr_block
}

output "rx_task_service_public_subnet_ids" {
  value = module.rx_task_service.public_subnet_ids
}

output "rx_task_service_private_subnet_ids" {
  value = module.rx_task_service.private_subnets_ids
}

output "rx_task_service_security_group_id" {
  value = module.rx_task_service.security_group_id
}

output "rx_task_service_vpc_endpoint_ids" {
  value = module.rx_task_service.vpc_endpoint_ids
}

output "rx_task_service_api_gateway_base_url" {
  value = module.rx_task_service.api_gateway_base_url
}

output "bastion_private_key" {
  value = module.rx_task_service.bastion_private_key_pem
}

output "bastion_public_dns" {
  value = module.rx_task_service.bastion_public_dns
}