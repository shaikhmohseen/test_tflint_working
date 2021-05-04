module "deployment_pipeline" {
  source                      = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-deployment-pipeline-for-service/v1.0.1.zip"
  env                         = var.env
  deployment_account          = var.deployment_account
  build_artifacts_bucket_name = var.build_artifacts_bucket_name
  build_artifacts_bucket_arn  = var.build_artifacts_bucket_arn
  service_name                = local.service_name
  tags                        = var.tags
}
