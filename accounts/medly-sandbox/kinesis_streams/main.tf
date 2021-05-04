provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket         = "medly-sandbox-terraform-state"
    key            = "global/kinesis_streams/terraform.tfstate"
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


module "prescription_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.0.0.zip"
  stream_name                       = "prescription"
  kinesis_stream_backup_bucket_name = data.terraform_remote_state.s3.outputs.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}
