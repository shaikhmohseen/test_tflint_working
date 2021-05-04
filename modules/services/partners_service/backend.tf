module "vpc" {
  source               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-vpc/v1.1.2.zip"
  service_name         = local.service_name
  env                  = var.env
  aws_region           = var.aws_region
  name                 = "${local.service_name}-vpc"
  cidr_block           = var.cidr_block
  availability_zones   = var.availability_zones
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_nat_gateway   = var.enable_nat_gateway
  tags                 = local.tags
}

locals {
  service_name = "partners-service"
  tags = merge(var.tags, {
    Name    = local.service_name
    service = local.service_name
    env     = var.env
  })
}

module "api_gateway" {
  source                = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-api-gateway/v1.1.4.zip"
  name                  = "${local.service_name}-rest-api"
  env                   = var.env
  tags                  = local.tags
  api_gateway_types     = var.api_gateway_types
  service_name          = local.service_name
  enable_api_gw_logging = var.enable_api_gw_logging
  api_gw_logging_level  = var.api_gw_logging_level
}

module "users_table" {
  source         = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-dynamodb/v1.2.0.zip"
  name           = var.users_table_name
  hash_key       = var.users_table_hash_key
  attributes     = var.users_table_attributes
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  tags           = var.tags
  service_name   = local.service_name
}

module "cache_table" {
  source         = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-dynamodb/v1.2.0.zip"
  name           = var.cache_table_name
  hash_key       = var.cache_table_hash_key
  attributes     = var.cache_table_attributes
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  tags           = var.tags
  service_name   = local.service_name
}
