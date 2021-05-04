data "aws_iam_role" "devops" {
  name = "AWSReservedSSO_DevOps_cb62152c84697f04"
}

module "tfstate" {
  source                               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-tfstate-resources/v2.0.0.zip"
  aws_account_ids                      = []
  namespace                            = var.namespace
  env                                  = var.env
  unique_ids_for_roles_to_allow_access = [data.aws_iam_role.devops.unique_id]
}
