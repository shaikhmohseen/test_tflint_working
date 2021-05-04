provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket         = "medly-sandbox-terraform-state"
    key            = "global/deployment-pipeline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-sandbox-state-locks"
    encrypt        = true
    profile        = "medly-sandbox"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket  = "medly-sandbox-terraform-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-sandbox"
  }
}

data "terraform_remote_state" "apps" {
  backend = "s3"
  config = {
    bucket  = "medly-sandbox-terraform-state"
    key     = "global/apps/terraform.tfstate"
    region  = "us-east-1"
    profile = "medly-sandbox"
  }
}

data "aws_iam_policy_document" "default" {

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
      data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn,
      "${data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn}/*",
    ]
  }
}


resource "aws_iam_user" "s3_user" {
  name          = "${var.service_name}-ibd-artifact-user"
  force_destroy = true
}

resource "aws_iam_access_key" "s3_user_access_key" {
  user       = aws_iam_user.s3_user.name
  depends_on = [aws_iam_user.s3_user]
}

resource "aws_iam_user_policy" "default" {
  user   = aws_iam_user.s3_user.name
  policy = data.aws_iam_policy_document.default.json

}

resource "aws_iam_role" "code_pipeline_role" {
  name = "${var.service_name}-code-pipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy"
  role = aws_iam_role.code_pipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "${data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn}",
        "${data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild",
        "codebuild:DescribeSecurityGroups"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

locals {
  s3_object_ibd_service = "bundle.zip"
  s3_object_ibd_app     = "dist.zip"
  s3_bucket             = data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_arn
  pipeline_name         = "${var.service_name}-${var.deployment_account}-deploy"
  ssm_parameter_name    = "/deployment/${local.pipeline_name}"
}

resource "aws_codepipeline" "codepipeline" {
  name     = local.pipeline_name
  role_arn = aws_iam_role.code_pipeline_role.arn

  artifact_store {
    location = data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_name
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "IBD-Service-Artifact"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["service"]

      configuration = {
        "S3Bucket"             = data.terraform_remote_state.s3.outputs.ibd_build_assets_bucket_name,
        "PollForSourceChanges" = true,
        "S3ObjectKey"          = local.s3_object_ibd_service
      }
      run_order = 1
    }

  }

  stage {
    name = "Deploy-Sandbox"

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
            value = local.ssm_parameter_name
            type  = "PLAINTEXT"
          }
        ])
        ProjectName = "${var.service_name}-${var.env}-deploy-service-codebuild-project"
      }
    }
  }

}