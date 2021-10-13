data "aws_sns_topic" "sns_e2e_tests_notification" {
  name = "medly-ios-e2e-tests-sns"
}

data "aws_iam_policy_document" "sns_user_iam_policy" {
  statement {
    sid = "1"
    actions = [
      "SNS:Publish",
      "SNS:Subscribe"
    ]
    effect = "Allow"
    resources = [
      data.aws_sns_topic.sns_e2e_tests_notification.arn
    ]
  }
}

module "sns_user" {
  source       = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-iam-system-user/v1.1.1.zip"
  env          = var.env
  service_name = "sns-service"
  policy       = data.aws_iam_policy_document.sns_user_iam_policy.json
}
