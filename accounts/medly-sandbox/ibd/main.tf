provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket         = "medly-sandbox-terraform-state"
    key            = "global/ibd/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-sandbox-state-locks"
    encrypt        = true
    profile        = "medly-sandbox"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket  = "medly-sandbox-terraform-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-sandbox"
  }
}

module "ibd" {
  source                       = "../../../modules/ibd"
  env                          = var.env
  deployment_account           = ""
  aws_region                   = var.aws_region
  availability_zones           = var.availability_zones
  cidr_block                   = var.cidr_block
  private_subnets              = var.private_subnets
  public_subnets               = var.public_subnets
  database_subnets             = var.database_subnets
  db_rds_username              = var.rds_username
  db_rds_password              = var.rds_password
  db_rds_dbname                = var.rds_dbname
  db_max_capacity              = var.rds_max_capacity
  db_min_capacity              = var.rds_min_capacity
  db_auto_pause                = var.rds_auto_pause
  frontend_s3_bucket_name      = data.terraform_remote_state.s3.outputs.ibd_app_s3_bucket_name
  domain_name                  = var.domain_name
  build_assets_bucket_arn      = data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn
  ibd_uploads_bucket_arn       = data.terraform_remote_state.s3.outputs.ibd_uploads_s3_bucket_arn
  amplify_repository_url       = var.amplify_repository_url
  amplify_github_enabled       = var.amplify_github_enabled
  amplify_branch_patterns      = var.amplify_branch_patterns
  ssm_path_amplify_resource_id = "/${var.deployment_account}/${var.service_name}/amplify/resource_id"
}
