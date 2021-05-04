output "scheduling_service_cidr_block" {
  value = module.scheduling_service.cidr_block
}

output "scheduling_service_public_subnet_ids" {
  value = module.scheduling_service.public_subnet_ids
}

output "scheduling_service_private_subnet_ids" {
  value = module.scheduling_service.private_subnets_ids
}

output "scheduling_service_security_group_id" {
  value = module.scheduling_service.security_group_id
}

output "scheduling_service_vpc_endpoint_ids" {
  value = module.scheduling_service.vpc_endpoint_ids
}

output "scheduling_service_api_gateway_base_url" {
  value = module.scheduling_service.api_gateway_base_url
}

output "bastion_private_key" {
  value = module.scheduling_service.bastion_private_key_pem
}

output "bastion_public_dns" {
  value = module.scheduling_service.bastion_public_dns
}