locals {
  tags = {
    service = var.service_name
    env     = var.env
  }
}

module "trigger_deployment_lambda_cross_account_roles" {
  source                            = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-trigger-deployment-lambda-cross-account-roles/v1.1.0.zip"
  env                               = var.env
  lambda_account_arn                = var.lambda_account_arn
  service_name                      = var.service_name
  dev_terraform_state_bucket        = var.dev_terraform_state_bucket
  dev_terraform_state_s3_module_key = var.dev_terraform_state_s3_module_key
  dev_aws_profile                   = var.dev_aws_profile
  dev_aws_region                    = var.dev_aws_region
}

module "api_gateway" {
  source = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-api-gateway/v1.1.0.zip"
  name   = "${var.service_name}-rest-api"
  env    = var.env
  tags   = local.tags
}
