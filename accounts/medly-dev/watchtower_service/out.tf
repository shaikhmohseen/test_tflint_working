output "watchtower_service_cidr_block" {
  value = module.watchtower_service.cidr_block
}

output "watchtower_service_vpc_id" {
  value = module.watchtower_service.vpc_id
}

output "watchtower_service_public_subnet_ids" {
  value = module.watchtower_service.public_subnet_ids
}

output "watchtower_service_private_subnet_ids" {
  value = module.watchtower_service.private_subnets_ids
}

output "watchtower_service_api_gateway_base_url" {
  value = module.watchtower_service.api_gateway_base_url
}