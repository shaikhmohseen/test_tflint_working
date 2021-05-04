module "users" {
  source             = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-iam-users/v1.0.1.zip"
  users              = var.users
  deployment_account = var.deployment_account
}
