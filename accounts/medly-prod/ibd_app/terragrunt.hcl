terraform {
  source = "../../../modules/apps//ibd_app"
}

dependency "s3" {
  config_path = "../../medly-dev/s3/"
}

inputs = {
  env = "prod"
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
}

include {
  path = find_in_parent_folders()
}
