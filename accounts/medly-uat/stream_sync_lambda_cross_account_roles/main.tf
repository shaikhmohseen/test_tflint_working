module "stream_sync_lambda_cross_account_roles" {
  source                                = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-stream-sync-lambda-cross-account-roles/v1.1.0.zip"
  env                                   = var.env
  sync_stream_lambda_execution_role_arn = var.sync_stream_lambda_execution_role_arn
  service_name                          = var.service_name
  source_stream_arn_list                = var.source_stream_arn_list
}
