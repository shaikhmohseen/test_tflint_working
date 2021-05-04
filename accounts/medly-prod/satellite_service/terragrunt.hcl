terraform {
  source = "../../..//accounts/medly-prod/satellite_service"
}

dependency "s3" {
  config_path = "../s3"
}

dependency "dev_s3" {
  config_path = "../../medly-dev/s3/"
}

inputs = {
  dev_build_artifacts_bucket_arn    = dependency.dev_s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_arn        = dependency.s3.outputs.build_artifacts_bucket_arn
  scripts_s3_bucket                 = dependency.s3.outputs.scripts_bucket_name
  scripts_s3_bucket_arn             = dependency.s3.outputs.scripts_bucket_arn
  bastion_public_keys_s3_bucket     = dependency.s3.outputs.bastion_public_keys_bucket_name
  bastion_public_keys_s3_bucket_arn = dependency.s3.outputs.bastion_public_keys_bucket_arn
}

include {
  path = find_in_parent_folders()
}
