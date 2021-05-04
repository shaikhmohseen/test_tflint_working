terraform {
  source = "."
}

dependency "dev_s3" {
  config_path = "../../../medly-dev/s3/"
}

inputs = {
  dev_build_artifacts_bucket_arn = dependency.dev_s3.outputs.build_artifacts_bucket_arn
  dev_build_artifacts_bucket_name = dependency.dev_s3.outputs.build_artifacts_bucket_name
}

include {
  path = find_in_parent_folders()
}
