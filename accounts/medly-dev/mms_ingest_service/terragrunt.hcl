terraform {
  source = "../../../modules/services//mms_ingest_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_name = dependency.s3.outputs.build_artifacts_bucket_name
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
  aws_region                 = "us-east-1"
  deployment_account         = "medly-dev"
  env                        = "dev"
  availability_zones         = ["us-east-1a", "us-east-1b"]
  cidr_block                 = "10.10.0.0/16"
  private_subnets            = ["10.10.0.0/24", "10.10.1.0/24"]
  public_subnets             = ["10.10.2.0/24", "10.10.3.0/24"]
  database_subnets           = ["10.10.4.0/24", "10.10.5.0/24"]
  api_gateway_types          = ["REGIONAL"]
  enable_api_gw_logging      = false
  api_gw_logging_level       = "INFO"
}

include {
  path = find_in_parent_folders()
}