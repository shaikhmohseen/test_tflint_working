module "satellite_service" {
  source                     = "../../../modules/services/satellite-service"
  env                        = var.env
  deployment_account         = var.deployment_account
  aws_region                 = var.aws_region
  availability_zones         = var.availability_zones
  cidr_block                 = var.cidr_block
  private_subnets            = var.private_subnets
  public_subnets             = var.public_subnets
  database_subnets           = var.database_subnets
  build_artifacts_bucket_arn = var.build_artifacts_bucket_arn
  api_gateway_types          = var.api_gateway_types
  enable_api_gw_logging      = var.enable_api_gw_logging
  api_gw_logging_level       = var.api_gw_logging_level
}
