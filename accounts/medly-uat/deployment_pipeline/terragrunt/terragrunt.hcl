terraform {
  source = "../../../../modules/resources/codepipeline//infra"
}

include {
  path = find_in_parent_folders()
}

dependency "s3" {
  config_path = "../../s3/"
}

inputs = {
  github_enabled                = false
  next_env                      = "prod"
  deployment_account            = "medly-uat"
  source_github_repository_name = "platform-infra"
  env_directory                 = "accounts/medly-uat"

  build_artifacts_bucket_arn  = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name = dependency.s3.outputs.build_artifacts_bucket_name

  next_env_build_artifacts_bucket_name = "medly-prod-build-artifacts"
  next_env_build_artifacts_bucket_arn  = "arn:aws:s3:::medly-prod-build-artifacts"

}
