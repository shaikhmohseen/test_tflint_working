terraform {
  source = "../../../modules/services//prescription_service"
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
  deployment_account                = "medly-dev"
  aws_region                        = "us-east-1"
  env                               = "dev"
  domain_name                       = "dev-medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.0.0.0/16"
  private_subnets                   = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets                    = ["10.0.2.0/24", "10.0.3.0/24"]
  database_subnets                  = ["10.0.4.0/24", "10.0.5.0/24"]
  db_rds_username                   = "prescription_service_user"
  db_rds_password                   = "prescription_service_password"
  db_rds_dbname                     = "prescription_service_db"
  db_max_capacity                   = 2
  db_min_capacity                   = 2
  db_auto_pause                     = false
  bastion_aws_key_pair_name         = "prescription_service_bastion"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = true
  enable_api_gw_logging             = false
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}
