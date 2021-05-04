terraform {
  source = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-codepipeline-for-app/v1.1.0.zip"
}

dependency "s3" {
  config_path = "../../../medly-dev/s3/"
}


inputs = {
  service_name                = "insurance-app"
  env                         = "prod"
  build_artifacts_bucket_arn  = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name = dependency.s3.outputs.build_artifacts_bucket_name
}

include {
  path = find_in_parent_folders()
}
