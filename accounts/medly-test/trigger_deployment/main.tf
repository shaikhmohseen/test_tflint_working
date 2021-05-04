module "trigger_deployment_lambda_cross_account_roles" {
  source                         = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-trigger-deployment-lambda-cross-account-roles/v1.1.1.zip"
  env                            = var.env
  lambda_account_arn             = var.lambda_account_arn
  service_name                   = var.service_name
  dev_build_artifacts_bucket_arn = var.dev_build_artifacts_bucket_arn
}
