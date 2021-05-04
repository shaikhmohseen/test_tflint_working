inputs = {
  build_artifacts_bucket_arn  = "arn:aws:s3:::medly-dev-build-artifacts"
  build_artifacts_bucket_name = "medly-dev-build-artifacts"
}

include {
  path = find_in_parent_folders()
}
