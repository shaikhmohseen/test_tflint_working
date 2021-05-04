data "aws_iam_policy_document" "refill_gsdd_bucket_access_assumerole_policy_document" {
  statement {
    sid = "1"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "AWS"
      identifiers = [var.root_account_id]
    }
  }
}

data "aws_iam_policy_document" "refill_gsdd_bucket_role_policy_document" {
  statement {

    sid = "1"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::${var.deployment_account}-refill-management-gsdd-exports",
      "arn:aws:s3:::${var.deployment_account}-refill-management-gsdd-exports/*"
    ]
  }
}

resource "aws_iam_role" "refill_bucket_access_role" {
  name               = "${var.deployment_account}-refill-gsdd-bucket-role"
  assume_role_policy = data.aws_iam_policy_document.refill_gsdd_bucket_access_assumerole_policy_document.json
}

resource "aws_iam_role_policy" "refill_gsdd_bucket_role_policy" {
  role   = aws_iam_role.refill_bucket_access_role.name
  policy = data.aws_iam_policy_document.refill_gsdd_bucket_role_policy_document.json
}

data "aws_iam_policy_document" "cross_account_bucket_policy" {
  statement {
    sid = "1"

    principals {
      identifiers = var.test_account_arn
      type        = "AWS"
    }

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:ListBucket"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.deployment_account}-build-artifacts",
      "arn:aws:s3:::${var.deployment_account}-build-artifacts/*"
    ]
  }
}

resource "aws_s3_bucket" "kinesis_stream_backups" {
  bucket = "${var.deployment_account}-kinesis-stream-backups"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "ibd_build_assets" {
  bucket = "${var.deployment_account}-ibd-build-assets"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "ibd_uploads" {
  bucket = "${var.deployment_account}-ibd-uploads"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    service = "ibd"
    env     = var.env
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket" "ins_uploads" {
  bucket = "${var.deployment_account}-ins-uploads"
  acl    = "private"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    service = "ins"
    env     = var.env
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket" "build_artifacts" {
  bucket = "${var.deployment_account}-build-artifacts"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
  policy = data.aws_iam_policy_document.cross_account_bucket_policy.json
}

locals {
  dummy_source_object_name = "donotdelete_dummy_source.zip"
}

resource "null_resource" "create_zip" {
  provisioner "local-exec" {
    command = "echo 'This is dummy source for code pipeline' >> codepipeline_dummy_source_artifact.txt && zip ${local.dummy_source_object_name} codepipeline_dummy_source_artifact.txt"
  }
}

resource "aws_s3_bucket_object" "codepipeline_s3_source_artifact_object" {
  bucket = aws_s3_bucket.build_artifacts.bucket
  key    = local.dummy_source_object_name
  source = "${path.module}/${local.dummy_source_object_name}"
}

resource "aws_s3_bucket" "bastion_public_keys" {
  bucket = "${var.deployment_account}-bastion-public-keys"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.deployment_account}-logs"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "scripts" {
  bucket = "${var.deployment_account}-scripts"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "public_assets" {
  bucket = "${var.deployment_account}-public-assets"
  acl    = "public-read"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "dph_uploads" {
  bucket = "${var.deployment_account}-dph-uploads"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    service = "delivery-hospitals-service"
    env     = var.env
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket" "dp_uploads" {
  bucket = "${var.deployment_account}-dp-uploads"
  acl    = "private"

  tags = {
    service = "delivery-service"
    env     = var.env
  }

  lifecycle_rule {
    id      = "failed-deliveries"
    enabled = true

    prefix = "dp-uploads/failed-deliveries/"

    expiration {
      days = 3
    }
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket" "fs_uploads" {
  bucket = "${var.deployment_account}-fs-uploads"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    service = "facility-service"
    env     = var.env
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket" "refill_management_gsdd_uploads" {
  bucket = "${var.deployment_account}-refill-management-gsdd-exports"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    service = "refill-management-service"
    env     = var.env
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}
