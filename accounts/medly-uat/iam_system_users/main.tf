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
    actions = ["s3:DeleteObjectTagging",
      "s3:PutObject",
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:ListBucket",
      "s3:PutObjectTagging",
    "s3:PutObjectAcl"]
    resources = [
      var.build_artifacts_bucket_arn,
      "${var.build_artifacts_bucket_arn}/*",
    ]
  }
}

module "build_artifacts_s3_user" {
  source       = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-iam-system-user/v1.1.0.zip"
  env          = var.env
  service_name = "s3_artifacts"
  policy       = data.aws_iam_policy_document.s3_build_artifacts.json

}
