data "aws_iam_role" "atlantis_ec2_role" {
  name = "atlantis-eb-medly-dev-ec2-role"
}

data "aws_iam_role" "devops_sso" {
  name = "AWSReservedSSO_DevOps_5efc3bc7f8521d02"
}

module "tfstate" {
  source                               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-tfstate-resources/v2.0.0.zip"
  aws_account_ids                      = values(var.aws_account_ids)
  allow_cross_account_access           = var.allow_cross_account_access
  env                                  = var.env
  namespace                            = var.namespace
  unique_ids_for_roles_to_allow_access = concat([data.aws_iam_role.devops_sso.unique_id], [data.aws_iam_role.atlantis_ec2_role.unique_id])
}
