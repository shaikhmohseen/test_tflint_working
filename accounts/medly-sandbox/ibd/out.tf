output "ibd_cidr_block" {
  value = module.ibd.cidr_block
}

output "ibd_vpc_id" {
  value = module.ibd.vpc_id
}

output "ibd_public_subnet_ids" {
  value = module.ibd.public_subnet_ids
}

output "ibd_private_subnet_ids" {
  value = module.ibd.private_subnets_ids
}

output "ibd_security_group_id" {
  value = module.ibd.security_group_id
}

output "ibd_vpc_endpoint_ids" {
  value = module.ibd.vpc_endpoint_ids
}

output "ibd_api_gateway_id" {
  value = module.ibd.api_gateway_id
}

output "ibd_api_gateway_base_url" {
  value = module.ibd.api_gateway_base_url
}
