locals {
  cloudtrail_bucket_name = "medly-${var.env}-cloudtrail-logs"
  log_prefix             = "restricted-bucket/"
}

data "aws_caller_identity" "current_account" {}

data "aws_iam_role" "devops" {
  name = "AWSReservedSSO_DevOps_cb62152c84697f04"
}

resource "aws_s3_bucket" "restricted_bucket" {
  bucket = "medly-${var.env}-restricted-bucket"
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
  acl = "private"

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  logging {
    target_bucket = aws_s3_bucket.access_logs.id
    target_prefix = local.log_prefix
  }
}

// objects in restricted_bucket cannot be public
resource "aws_s3_bucket_public_access_block" "restricted_bucket" {
  bucket = aws_s3_bucket.restricted_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "bucket_only_visible_to_roles" {
  statement {
    sid = "AllowDevopsAndRootRole"
    principals {
      identifiers = [
      "*"]
      type = "*"
    }
    effect = "Deny"
    actions = [
    "s3:*"]
    resources = [
      aws_s3_bucket.restricted_bucket.arn,
      "${aws_s3_bucket.restricted_bucket.arn}/*"
    ]
    condition {
      test = "StringNotLike"
      values = [
        "${data.aws_iam_role.devops.unique_id}:*",
      data.aws_caller_identity.current_account.account_id]
      variable = "aws:userid"
    }
  }
}

resource "aws_s3_bucket_policy" "limited_visibility_s3_bucket_policy" {
  bucket = aws_s3_bucket.restricted_bucket.id
  policy = data.aws_iam_policy_document.bucket_only_visible_to_roles.json
}


// s3 bucket for access logs
resource "aws_s3_bucket" "access_logs" {
  bucket = "medly-${var.env}-s3-access-logs"
  acl    = "log-delivery-write"
}

# Access logging
// objects in access_logs bucket cannot be public
resource "aws_s3_bucket_public_access_block" "access_logs" {
  bucket = aws_s3_bucket.access_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "allow_cloudtrail_policy" {

  statement {
    sid = "AWSCloudTrailAclCheck"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
    ]

    resources = [
      "arn:aws:s3:::${local.cloudtrail_bucket_name}",
    ]
  }

  statement {
    sid = "AWSCloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com", "cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${local.cloudtrail_bucket_name}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = local.cloudtrail_bucket_name
  policy = data.aws_iam_policy_document.allow_cloudtrail_policy.json
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

// objects in cloudtrail-logs bucket cannot be public
resource "aws_s3_bucket_public_access_block" "cloudtrail_bucket" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "cloudtrail" {
  source                        = "cloudposse/cloudtrail/aws"
  version                       = "0.20.0"
  namespace                     = "medly"
  stage                         = var.env
  name                          = "restricted-bucket-cloudtrail"
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = false
  enable_logging                = true
  s3_bucket_name                = local.cloudtrail_bucket_name
  event_selector = [
    {
      read_write_type           = "All"
      include_management_events = true

      data_resource = [
        {
          type = "AWS::S3::Object"

          # Make sure to append a trailing '/' to your ARN if you want
          # to monitor all objects in a bucket.
          values = [
          "${aws_s3_bucket.restricted_bucket.arn}/"]
      }]
  }]
}
