locals {
  aws_region  = "us-east-1"
  aws_profile = "medly-dev"
}

inputs = {
  tags      = { terraform = true, env = "dev" }
  env       = "dev"
  namespace = "medly"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "terraform_remote_backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.aws_profile}-terraform-state"
    key            = "global/${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "${local.aws_profile}-state-locks"
    encrypt        = true
    profile        = local.aws_profile
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  profile = "${local.aws_profile}"
}
EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = ">= 0.13"
  required_providers {
aws={version="=3.26.0", source="hashicorp/aws"}
okta={version="3.10.1", source="oktadeveloper/okta"}
  }
}
EOF
}
