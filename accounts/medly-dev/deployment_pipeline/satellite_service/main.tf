locals {
  pipeline_name      = "${var.service_name}-${var.deployment_account}-deploy"
  ssm_parameter_name = "/deployment/${local.pipeline_name}"
}

data "aws_iam_policy_document" "code_pipeline_assumerole_policy_document" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "code_pipeline_role" {
  name               = "${var.service_name}-code-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.code_pipeline_assumerole_policy_document.json
}

data "aws_iam_policy_document" "code_pipeline_role_policy_document" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject"
    ]
    resources = [
      var.build_artifacts_bucket_arn,
      "${var.build_artifacts_bucket_arn}/*"
    ]
  }

  statement {
    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
      "codebuild:DescribeSecurityGroups"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline_policy"
  role   = aws_iam_role.code_pipeline_role.id
  policy = data.aws_iam_policy_document.code_pipeline_role_policy_document.json
}

resource "aws_codepipeline" "codepipeline" {
  name     = local.pipeline_name
  role_arn = aws_iam_role.code_pipeline_role.arn

  artifact_store {
    location = var.build_artifacts_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Satellite-Service-Service-Artifact"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["service"]
      configuration = {
        "S3Bucket"             = var.build_artifacts_bucket_name,
        "PollForSourceChanges" = false,
        "S3ObjectKey"          = "donotdelete_dummy_source.zip"
      }
      run_order = 1
    }
  }

  stage {
    name = "Deploy-Dev"
    action {
      name            = "Global"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["service"]
      version         = "1"

      configuration = {
        EnvironmentVariables = jsonencode([
          {
            name  = "SSM_PARAMETER_PATH"
            value = aws_ssm_parameter.service_file_metadata.name
            type  = "PLAINTEXT"
          }
        ])
        ProjectName = "${var.service_name}-${var.env}-deploy-service-codebuild-project"
      }
    }
  }
}