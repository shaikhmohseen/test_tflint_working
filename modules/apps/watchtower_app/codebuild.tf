module "deploy_app" {
  source                     = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-codebuild-for-app/v1.1.2.zip"
  env                        = var.env
  deployment_account         = var.deployment_account
  build_artifacts_bucket_arn = var.build_artifacts_bucket_arn
  tags                       = var.tags
  service_name               = local.service_name
  amplify_github_enabled     = var.amplify_github_enabled
  amplify_resource_id        = module.amplify.amplify_resource_id
  env_vars_secret_key        = local.env_vars_secret_key
}
