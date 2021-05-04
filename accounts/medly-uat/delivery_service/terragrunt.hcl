terraform {
  source = "../../../modules/services//delivery_service/"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
  dp_uploads_s3_bucket_arn          = dependency.s3.outputs.dp_uploads_s3_bucket_arn
  dp_uploads_s3_bucket_name         = dependency.s3.outputs.dp_uploads_s3_bucket_name
  aws_region                        = "us-east-1"
  deployment_account                = "medly-uat"
  service_name                      = "delivery-service"
  domain_name                       = "uat-medly.io"
  availability_zones                = ["us-east-1a", "us-east-1b"]
  cidr_block                        = "10.56.0.0/16"
  private_subnets                   = ["10.56.0.0/24", "10.56.1.0/24"]
  public_subnets                    = ["10.56.2.0/24", "10.56.3.0/24"]
  database_subnets                  = ["10.56.4.0/24", "10.56.5.0/24"]
  db_rds_username                   = "delivery_service_user"
  db_rds_password                   = "delivery_service_password"
  db_rds_dbname                     = "delivery_service_db"
  db_max_capacity                   = 8
  db_min_capacity                   = 2
  db_auto_pause                     = false
  bastion_aws_key_pair_name         = "delivery_service_bastion"
  ssh_key_algorithm                 = "RSA"
  api_gateway_types                 = ["REGIONAL"]
  enable_rds_secrets_rotation       = true
  provisioned_concurrency_count     = 2
  enable_api_gw_logging             = true
  api_gw_logging_level              = "INFO"
}

include {
  path = find_in_parent_folders()
}