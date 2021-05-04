terraform {
  source = "../../../modules/services//patient_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name       = dependency.s3.outputs.build_artifacts_bucket_name
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  aws_region                        = "us-east-1"
  deployment_account                = "medly-prod"
  env                               = "prod"
  domain_name                       = "medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.157.0.0/16"
  private_subnets                   = ["10.157.0.0/24", "10.157.1.0/24"]
  public_subnets                    = ["10.157.2.0/24", "10.157.3.0/24"]
  database_subnets                  = ["10.157.4.0/24", "10.157.5.0/24"]
  db_rds_username                   = "patient_service_user"
  db_rds_password                   = "patient_service_password"
  db_rds_dbname                     = "patient_service_db"
  db_max_capacity                   = 8
  db_min_capacity                   = 2
  db_auto_pause                     = false
  bastion_aws_key_pair_name         = "patient_service_bastion"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = true
  provisioned_concurrency_count     = 5
  enable_http_endpoint              = false
  enable_api_gw_logging             = true
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}