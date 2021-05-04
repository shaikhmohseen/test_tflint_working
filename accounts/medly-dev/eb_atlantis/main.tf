module "eb_atlantis" {
  source                = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-eb-atlantis/v1.1.0.zip"
  env                   = var.env
  aws_region            = var.aws_region
  vpc_cidr_block        = var.vpc_cidr_block
  private_subnets       = var.private_subnets
  public_subnets        = var.public_subnets
  availability_zones    = var.availability_zones
  instance_type         = var.instance_type
  account_id            = var.account_id
  app_name              = var.app_name
  solution_stack_name   = var.solution_stack_name
  environment_type      = var.environment_type
  aws_key_pair_name     = var.aws_key_pair_name
  tier                  = var.tier
  environment_variables = var.environment_variables
  enable_nat_gateway    = var.enable_nat_gateway
}
