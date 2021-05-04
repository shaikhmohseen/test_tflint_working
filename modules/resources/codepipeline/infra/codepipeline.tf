module "codepipeline" {
  source                        = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-codepipeline-for-infra/v1.1.3.zip"
  build_artifacts_bucket_arn    = var.build_artifacts_bucket_arn
  build_artifacts_bucket_name   = var.build_artifacts_bucket_name
  deployment_account            = var.deployment_account
  env                           = var.env
  env_directory                 = var.env_directory
  github_enabled                = var.github_enabled
  source_github_repository_name = var.source_github_repository_name
}
