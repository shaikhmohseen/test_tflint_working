data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket  = "medly-dev-terraform-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-dev"
  }
}

data "aws_s3_bucket" "test_cases" {
  bucket = "${var.deployment_account}-test-cases"
}

data "aws_iam_policy_document" "s3_build_artifacts" {

  statement {

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {

    actions = [
      "s3:DeleteObjectTagging",
      "s3:PutObject",
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:ListBucket",
      "s3:PutObjectTagging",
      "s3:PutObjectAcl"
    ]

    resources = [
      data.terraform_remote_state.s3.outputs.build_artifacts_bucket_arn,
      "${data.terraform_remote_state.s3.outputs.build_artifacts_bucket_arn}/*",
      data.aws_s3_bucket.test_cases.arn,
      "${data.aws_s3_bucket.test_cases.arn}/*"
    ]
  }

  statement {

    actions = [
      "s3:DeleteObject",
    ]

    resources = [
      "${data.aws_s3_bucket.test_cases.arn}/hippoc/*"
    ]
  }
}

module "build_artifacts_s3_user" {
  source       = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-iam-system-user/v1.0.0.zip"
  env          = var.env
  service_name = "s3_artifacts"
  policy       = data.aws_iam_policy_document.s3_build_artifacts.json

}

data "aws_iam_policy_document" "read_terraform_modules_user" {

  statement {

    actions = [
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:GetObjectTagging"
    ]

    resources = [
      "${data.terraform_remote_state.s3.outputs.build_artifacts_bucket_arn}/terraform_modules/",
      "${data.terraform_remote_state.s3.outputs.build_artifacts_bucket_arn}/terraform_modules/*",
    ]
    sid = "1"
  }

}

module "read_terraform_modules_user" {
  source       = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-iam-system-user/v1.0.0.zip"
  env          = var.env
  service_name = "codebuild_terragrunt"
  policy       = data.aws_iam_policy_document.read_terraform_modules_user.json

}
