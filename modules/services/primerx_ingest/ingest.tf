module "eb_environment" {
  source                          = "git::https://github.com/scalereal/terraform-aws-elastic-beanstalk-environment.git"
  eb_app_name                     = module.elastic_beanstalk_application.name
  env                             = var.env
  service_name                    = var.service_name
  description                     = "for primerx-ingest and mmspy app"
  solution_stack_name             = var.mmspy_solution_stack_name
  vpc_id                          = module.vpc.id
  enable_enhanced_healthreporting = true
  private_subnets                 = module.vpc.private_subnets_ids
  public_subnets                  = module.vpc.public_subnet_ids
  environment_type                = var.mmspy_environment_type
  aws_key_pair_name               = var.mmspy_aws_key_pair_name
  tier                            = var.mmspy_tier
  instance_type                   = var.mmspy_instance_type
  environment_variables           = var.mmspy_environment_variables
  tags                            = var.mmspy_tags
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["elasticbeanstalk.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name   = "${var.service_name}-${var.env}-ecr-role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
     {
       "Sid": "Stmt1592534918955",
       "Action": "elasticbeanstalk:*",
       "Effect": "Allow",
       "Resource": "*"
     },
     {
       "Sid": "Stmt1592534972887",
       "Action": "ecr:*",
       "Effect": "Allow",
       "Resource": "*"
     }
   ]
 }  
  EOF
}


resource "aws_iam_role" "this" {
  name               = "eb_appversion_deletion_role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

module "elastic_beanstalk_application" {
  source                      = "scalereal/elastic-beanstalk-application/aws"
  version                     = "0.0.1"
  name                        = format("%s-%s-ingest", var.service_name, var.env)
  appversion_service_role_arn = aws_iam_role.this.arn
  appversion_max_age_in_days  = 90
}

resource "aws_ecr_repository" "this" {
  name                 = format("%s-%s-primerx-ingest", var.service_name, var.env)
  image_tag_mutability = var.ebp_ecr_image_tag_mutability
  tags                 = local.tags
  image_scanning_configuration {
    scan_on_push = true
  }
}
