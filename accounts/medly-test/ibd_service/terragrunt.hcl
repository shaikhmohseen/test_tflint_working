terraform {
  source = "../../../modules/services//ibd_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_name       = dependency.s3.outputs.build_artifacts_bucket_name
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
  ibd_uploads_s3_bucket_arn         = dependency.s3.outputs.ibd_uploads_s3_bucket_arn
  deployment_account                = "medly-test"
  service_name                      = "ibd-service"
  aws_profile                       = "medly-test"
  aws_region                        = "us-east-1"
  env                               = "test"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  domain_name                       = "test-medly.io"
  cidr_block                        = "10.101.0.0/16"
  private_subnets                   = ["10.101.0.0/24", "10.101.1.0/24"]
  public_subnets                    = ["10.101.2.0/24", "10.101.3.0/24"]
  database_subnets                  = ["10.101.4.0/24", "10.101.5.0/24"]
  db_rds_username                   = "ibd_user"
  db_rds_dbname                     = "ibd_db"
  rds_max_capacity                  = 2
  rds_min_capacity                  = 2
  rds_auto_pause                    = false
  bastion_aws_key_pair_name         = "ibd_bastion"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = true
  enable_api_gw_logging             = false
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}
