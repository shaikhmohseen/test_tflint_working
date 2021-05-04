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

resource "aws_security_group" "ibd_kinesis" {
  name = "${local.service_name}-${var.env}-kinesis-security-group"

  description = "Security group for the Kinesis Endpoint"
  vpc_id      = module.vpc.id

  tags = {
    service      = local.service_name
    env          = var.env
    role         = "security-group"
    Name         = "${local.service_name}.kinesis.vpc.endpoint.sg"
    owner        = local.service_name
    resource-for = local.service_name
  }
}

locals {
  service_name = "ibd-service"
  endpoints = [
    {
      service_suffix     = "kinesis-streams",
      vpc_endpoint_type  = "Interface",
      security_group_ids = [aws_security_group.ibd_kinesis.id]
    },
  ]
  tags = merge(var.tags, {
    service = local.service_name
    env     = var.env
  })
}

resource "aws_vpc_endpoint" "endpoints" {
  count              = length(local.endpoints)
  vpc_id             = module.vpc.id
  service_name       = "com.amazonaws.${var.aws_region}.${element(local.endpoints, count.index)["service_suffix"]}"
  vpc_endpoint_type  = local.endpoints[count.index]["vpc_endpoint_type"]
  security_group_ids = local.endpoints[count.index]["security_group_ids"]
  tags               = merge(local.tags, { Name = "${local.service_name}.vpc.endpoint", owner = local.service_name, resource-for = local.service_name })
}

module "postgres" {
  source                    = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-db/v2.0.0.zip"
  service_name              = local.service_name
  env                       = var.env
  vpc_cidr_block            = module.vpc.cidr_block
  vpc_id                    = module.vpc.id
  aws_db_subnet_group_name  = module.vpc.aws_db_subnet_group_name
  tags                      = local.tags
  master_username           = var.db_rds_username
  database_name             = var.db_rds_dbname
  max_capacity              = var.db_max_capacity
  min_capacity              = var.db_min_capacity
  final_snapshot_identifier = "${var.env}-final-snapshot"
  auto_pause                = var.db_auto_pause
  cluster_identifier        = "${local.service_name}-${var.env}-rds-cluster"
  subnet_ids                = module.vpc.private_subnets_ids
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

module "bastion" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-bastion/v1.2.2.zip"
  bastion_subnet_id                 = module.vpc.public_subnet_ids[0]
  domain_name                       = var.domain_name
  env                               = var.env
  service_name                      = local.service_name
  vpc_id                            = module.vpc.id
  aws_key_pair_name                 = var.bastion_aws_key_pair_name
  scripts_s3_bucket                 = var.scripts_s3_bucket
  scripts_s3_bucket_arn             = var.scripts_s3_bucket_arn
  bastion_public_keys_s3_bucket     = var.bastion_public_keys_s3_bucket
  bastion_public_keys_s3_bucket_arn = var.bastion_public_keys_s3_bucket_arn
  tags                              = var.tags
}
