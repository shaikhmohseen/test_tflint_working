output "satellite_service_cidr_block" {
  value = module.satellite_service.cidr_block
}

output "satellite_service_vpc_id" {
  value = module.satellite_service.vpc_id
}

output "satellite_service_public_subnet_ids" {
  value = module.satellite_service.public_subnet_ids
}

output "satellite_service_private_subnet_ids" {
  value = module.satellite_service.private_subnets_ids
}

output "satellite_service_api_gateway_base_url" {
  value = module.satellite_service.api_gateway_base_url
}
