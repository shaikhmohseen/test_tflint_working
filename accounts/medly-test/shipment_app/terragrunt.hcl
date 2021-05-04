terraform {
  source = "../../../modules/apps//shipment_app"
}

dependency "s3" {
  config_path = "../s3"
}

inputs = {
  env = "test"
  build_artifacts_bucket_arn = dependency.s3.outputs.build_artifacts_bucket_arn
}

include {
  path = find_in_parent_folders()
}
