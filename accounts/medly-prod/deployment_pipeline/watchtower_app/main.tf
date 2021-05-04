locals {
  s3_object_app_dist          = "donotdelete_dummy_source.zip"
  amplify_pipeline_name       = "${var.service_name}-amplify-${var.deployment_account}-deploy"
  ampliify_ssm_parameter_name = "/deployment/${local.amplify_pipeline_name}"
}

data "terraform_remote_state" "watchtower_app" {
  backend = "s3"
  config = {
    bucket  = "medly-prod-terraform-state"
    key     = "global/watchtower_app/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-prod"
  }
}

data "aws_iam_policy_document" "codepipeline_assumerole_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "amplify_code_pipeline_role" {
  name               = "${var.service_name}-${var.env}-amplify-code-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assumerole_policy.json
}

data "aws_iam_policy_document" "amplify_code_pipeline_role_policy_document" {
  statement {
    sid = "1"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      var.dev_build_artifacts_bucket_arn,
      "${var.dev_build_artifacts_bucket_arn}/*"
    ]
  }
  statement {
    sid = "2"
    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
      "codebuild:DescribeSecurityGroups"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid = "3"
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = [
      "*"
    ]
  }

}

resource "aws_iam_role_policy" "amplify_codepipeline_policy" {
  name   = "${var.service_name}-${var.env}-code-pipeline-policy"
  role   = aws_iam_role.amplify_code_pipeline_role.id
  policy = data.aws_iam_policy_document.amplify_code_pipeline_role_policy_document.json
}

resource "aws_codepipeline" "amplify_codepipeline" {
  name     = local.amplify_pipeline_name
  role_arn = aws_iam_role.amplify_code_pipeline_role.arn

  artifact_store {
    location = var.dev_build_artifacts_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "watchtower-App-Artifact"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["app"]

      configuration = {
        "S3Bucket"             = var.dev_build_artifacts_bucket_name,
        "PollForSourceChanges" = false,
        "S3ObjectKey"          = local.s3_object_app_dist
      }
      run_order = 1
    }
  }

  stage {
    name = "Deploy-PROD-Amplify"

    action {
      name            = "Global"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["app"]
      version         = "1"

      configuration = {
        EnvironmentVariables = jsonencode([
          {
            name  = "SSM_PARAMETER_PATH"
            value = aws_ssm_parameter.amplify_file_metadata.name
            type  = "PLAINTEXT"
          }
        ])
        ProjectName = data.terraform_remote_state.watchtower_app.outputs.watchtower_app_amplify_release_codebuild_project
      }
    }
  }
}
