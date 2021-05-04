terraform {
  source = "../../../modules/services//insurance_service"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  ins_uploads_s3_bucket_arn         = dependency.s3.outputs.ins_uploads_s3_bucket_arn
  ins_uploads_s3_bucket_name        = dependency.s3.outputs.ins_uploads_s3_bucket_name
  build_artifacts_bucket_name       = dependency.s3.outputs.build_artifacts_bucket_name
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
  aws_region                        = "us-east-1"
  deployment_account                = "medly-dev"
  env                               = "dev"
  service_name                      = "insurance-service"
  domain_name                       = "dev-medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.16.0.0/16"
  private_subnets                   = ["10.16.0.0/24", "10.16.1.0/24"]
  public_subnets                    = ["10.16.2.0/24", "10.16.3.0/24"]
  database_subnets                  = ["10.16.4.0/24", "10.16.5.0/24"]
  db_rds_username                   = "insurance_service_user"
  db_rds_password                   = "insurance_service_password"
  db_rds_dbname                     = "insurance_service_db"
  db_max_capacity                   = 2
  db_min_capacity                   = 2
  db_auto_pause                     = false
  bastion_aws_key_pair_name         = "insurance_service_bastion"
  ssh_key_algorithm                 = "RSA"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = true
  enable_api_gw_logging             = false
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}