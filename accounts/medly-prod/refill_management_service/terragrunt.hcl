terraform {
  source = "../../../modules/services//refill_management_service"
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
  rms_uploads_s3_bucket_arn         = dependency.s3.outputs.rms_gsdd_s3_bucket_arn
  rms_uploads_s3_bucket_name        = dependency.s3.outputs.rms_gsdd_s3_bucket_name
  rms_report_sender_email           = "no-reply@refill-management.medly.com"
  rms_ses_domain                    = "refill-management.medly.com"
  deployment_account                = "medly-prod"
  aws_region                        = "us-east-1"
  env                               = "prod"
  domain_name                       = "medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.173.0.0/16"
  private_subnets                   = ["10.173.0.0/24", "10.173.1.0/24"]
  public_subnets                    = ["10.173.2.0/24", "10.173.3.0/24"]
  database_subnets                  = ["10.173.4.0/24", "10.173.5.0/24"]
  db_rds_username                   = "refill_management_service_user"
  db_rds_dbname                     = "refill_management_service_db"
  rds_max_capacity                  = 2
  rds_min_capacity                  = 2
  rds_auto_pause                    = false
  bastion_aws_key_pair_name         = "refill_management_service_bastion"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = false
  enable_http_endpoint              = true
  allow_rds_secret_access           = true
  enable_api_gw_logging             = true
}

include {
  path = find_in_parent_folders()
}
