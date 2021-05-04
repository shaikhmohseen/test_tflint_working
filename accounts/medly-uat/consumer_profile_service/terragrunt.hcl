terraform {
  source = "../../../modules/services//consumer_profile_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
  aws_region                 = "us-east-1"
  availability_zones         = ["us-east-1a", "us-east-1b"]
  cidr_block                 = "10.72.0.0/16"
  private_subnets            = ["10.72.0.0/24", "10.72.1.0/24"]
  public_subnets             = ["10.72.2.0/24", "10.72.3.0/24"]
  database_subnets           = ["10.72.4.0/24", "10.72.5.0/24"]
  api_gateway_types          = ["REGIONAL"]
  hash_key                   = "id"
  read_capacity              = 20
  write_capacity             = 20
  attributes = [
    {
      name = "id"
      type = "S"
    }
  ]
  provisioned_concurrency_count = 2
  enable_api_gw_logging         = true
  api_gw_logging_level          = "INFO"
}

include {
  path = find_in_parent_folders()
}
