terraform {
  source = "../../..//accounts/medly-dev/satellite_app"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
}

include {
  path = find_in_parent_folders()
}