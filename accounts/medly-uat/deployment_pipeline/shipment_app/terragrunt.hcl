terraform {
  source = "../../../../modules/resources/codepipeline//amplify"
}

dependency "s3" {
  config_path = "../../../medly-dev/s3/"
}


inputs = {
  service_name                = "shipment-app"
  build_artifacts_bucket_arn  = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name = dependency.s3.outputs.build_artifacts_bucket_name
}

include {
  path = find_in_parent_folders()
}
