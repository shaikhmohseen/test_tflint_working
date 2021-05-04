data "aws_iam_role" "codebuild_role" {
  name = "platform-infra-prod-codebuild-role"
}

data "aws_iam_role" "devops_sso" {
  name = "AWSReservedSSO_DevOps_f527729ac10ffc6b"
}

module "tfstate" {
  source                               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-tfstate-resources/v2.0.0.zip"
  aws_account_ids                      = var.aws_account_ids
  allow_cross_account_access           = var.allow_cross_account_access
  env                                  = var.env
  namespace                            = var.namespace
  unique_ids_for_roles_to_allow_access = [data.aws_iam_role.devops_sso.unique_id, data.aws_iam_role.codebuild_role.unique_id]
}
