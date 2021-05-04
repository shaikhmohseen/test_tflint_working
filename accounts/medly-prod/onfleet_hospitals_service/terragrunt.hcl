terraform {
  source = "../../../modules/services//onfleet_hospitals_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name       = dependency.s3.outputs.build_artifacts_bucket_name
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
  deployment_account                = "medly-prod"
  aws_region                        = "us-east-1"
  env                               = "prod"
  domain_name                       = "medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.167.0.0/16"
  private_subnets                   = ["10.167.0.0/24", "10.167.1.0/24"]
  public_subnets                    = ["10.167.2.0/24", "10.167.3.0/24"]
  database_subnets                  = ["10.167.4.0/24", "10.167.5.0/24"]
  db_rds_username                   = "onfleet_hospitals_service_user"
  db_rds_password                   = "onfleet_hospitals_service_password"
  db_rds_dbname                     = "onfleet_hospitals_service_db"
  db_max_capacity                   = 8
  db_min_capacity                   = 2
  db_auto_pause                     = false
  bastion_aws_key_pair_name         = "onfleet_hospitals_service_bastion"
  api_gateway_types                 = ["REGIONAL"]
  service_name                      = "onfleet-hospitals-service"
  enable_rds_secrets_rotation       = true
  enable_http_endpoint              = true
  allow_rds_secret_access           = true
  provisioned_concurrency_count     = 5
  enable_api_gw_logging             = true
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}
