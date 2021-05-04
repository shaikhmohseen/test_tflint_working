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
  database_subnets     = var.database_subnets
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_nat_gateway   = var.enable_nat_gateway
  tags                 = local.tags
}

locals {
  service_name = "mms-ingest-service"
  tags = merge(var.tags, {
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

module "mms_ingest_table" {
  source                        = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-dynamodb-table/v1.2.1.zip"
  name                          = "${local.service_name}.${var.mms_ingest_table_name}"
  hash_key                      = var.dynamodb_hash_key
  attributes                    = var.dynamodb_attributes
  read_capacity                 = var.dynamodb_read_capacity
  write_capacity                = var.dynamodb_write_capacity
  service_name                  = "${local.service_name}.${var.patient_table_name}"
  enable_point_in_time_recovery = var.enable_point_in_time_recovery
  tags                          = var.tags
}

module "prescription_table" {
  source                        = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-dynamodb-table/v1.2.1.zip"
  name                          = "${local.service_name}.${var.prescription_table_name}"
  hash_key                      = var.dynamodb_hash_key
  attributes                    = var.dynamodb_attributes
  read_capacity                 = var.dynamodb_read_capacity
  write_capacity                = var.dynamodb_write_capacity
  service_name                  = "${local.service_name}.${var.patient_table_name}"
  enable_point_in_time_recovery = var.enable_point_in_time_recovery
  tags                          = var.tags
}

module "patient_table" {
  source                        = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-dynamodb-table/v1.2.1.zip"
  name                          = "${local.service_name}.${var.patient_table_name}"
  hash_key                      = var.dynamodb_hash_key
  attributes                    = var.dynamodb_attributes
  read_capacity                 = var.dynamodb_read_capacity
  write_capacity                = var.dynamodb_write_capacity
  service_name                  = "${local.service_name}.${var.patient_table_name}"
  enable_point_in_time_recovery = var.enable_point_in_time_recovery
  tags                          = var.tags
}
