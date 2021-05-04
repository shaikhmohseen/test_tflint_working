terraform {
  source = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-codepipeline-for-infra/v1.1.3.zip"
}

include {
  path = find_in_parent_folders()
}

dependency "s3" {
  config_path = "../../s3/"
}

inputs = {
  github_enabled                = false
  env                           = "prod"
  deployment_account            = "medly-prod"
  source_github_repository_name = "platform-infra"
  env_directory                 = "accounts/medly-prod"
  build_artifacts_bucket_arn    = dependency.s3.outputs.build_artifacts_bucket_arn
  build_artifacts_bucket_name   = dependency.s3.outputs.build_artifacts_bucket_name
}
