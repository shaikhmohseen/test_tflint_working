module "codepipeline" {
  source                      = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-codepipeline-for-app/v1.1.0.zip"
  build_artifacts_bucket_arn  = var.build_artifacts_bucket_arn
  build_artifacts_bucket_name = var.build_artifacts_bucket_name
  env                         = var.env
  service_name                = var.service_name
}
