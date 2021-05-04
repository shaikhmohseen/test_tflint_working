data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket  = "medly-dev-terraform-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-dev"
  }
}

module "patient_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "patient"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "prescription_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "prescription"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "mms_patient_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "mms-patient"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "mms_prescription_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "mms-prescription"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "onfleet_hospitals_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "onfleet-hospitals"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "onfleet_internal_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "onfleet-internal"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "dph_mms_patient_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "dph-mms-patient"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}

module "dph_mms_prescription_stream" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-kinesis/v1.1.0.zip"
  stream_name                       = "dph-mms-prescription"
  kinesis_stream_backup_bucket_name = var.kinesis_stream_backups_bucket_name
  enable_stream_backup              = true
}
