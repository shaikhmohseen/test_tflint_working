locals {
  aws_region  = "us-east-1"
  aws_profile = "medly-uat"
}

inputs = {
  env       = "uat"
  tags      = { terraform = true, env = "uat" }
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
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = "= 0.14.6"
  required_providers {
    aws={version="=3.26.0", source="hashicorp/aws"}
    okta={version="3.10.1", source="oktadeveloper/okta"}
  }
}
EOF
}

// commented out because it runs while auto-init as well
// uncomment for local use, when need to create/update lock files
//terraform {
//  # https://github.com/hashicorp/terraform/issues/27810
//  # https://github.com/gruntwork-io/terragrunt/issues/1527
//
//  # The below after_hook would not be ideal when version constraints for
//  # terraform and providers are not strict, but should not cause any problems here
//
//  # used for `terragrunt providers`
//  before_hook "providers_remove_.terraform.lock.hcl" {
//    commands     = ["providers"]
//    execute      = ["rm", ".terraform.lock.hcl"]
//    run_on_error = false
//  }
//
//  # used for `terragrunt init`
//  after_hook "init_remove_.terraform.lock.hcl" {
//    commands     = ["init"]
//    execute      = ["rm", ".terraform.lock.hcl"]
//    run_on_error = false
//  }
//
//  after_hook "init_lock_providers" {
//    commands     = ["init"]
//    execute      = ["terraform", "providers", "lock", "-platform=darwin_amd64", "-platform=linux_amd64"]
//    run_on_error = false
//  }
//}
