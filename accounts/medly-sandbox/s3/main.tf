provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket         = "medly-sandbox-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-sandbox-state-locks"
    encrypt        = true
    profile        = "medly-sandbox"
  }
}

data "aws_canonical_user_id" "current" {}

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

resource "aws_s3_bucket" "ibd_app" {
  bucket = "${var.deployment_account}-ibd-app"
  acl    = "public-read"

  tags = {
    service = "ibd"
    env     = var.env
  }

  website {
    index_document = "index.html"
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = [var.ibd_domain_name]
    max_age_seconds = 3000
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

resource "aws_s3_bucket" "build_artifacts" {
  bucket = "${var.deployment_account}-artifacts"
  acl    = "private"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
}