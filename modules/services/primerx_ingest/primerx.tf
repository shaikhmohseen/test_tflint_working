locals {
  tags = merge(var.tags, {
    service = var.service_name
    env     = var.env
  })
}

module "vpc" {
  source               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-vpc/v1.0.1.zip"
  service_name         = var.service_name
  env                  = var.env
  aws_region           = var.aws_region
  name                 = "primerx-vpc"
  cidr_block           = var.pr_vpc_cidr_block
  availability_zones   = var.pr_availability_zones
  public_subnets       = var.pr_public_subnets
  private_subnets      = var.pr_private_subnets
  enable_dns_support   = var.pr_enable_dns_support
  enable_dns_hostnames = var.pr_enable_dns_hostnames
  enable_nat_gateway   = var.pr_enable_nat_gateway
  tags                 = local.tags
}

resource "tls_private_key" "default" {
  algorithm = "RSA"
}

resource "aws_key_pair" "primerx_key" {
  key_name   = var.pr_key_name
  public_key = tls_private_key.default.public_key_openssh
}

resource "aws_instance" "primerx-instance" {
  ami                    = var.pr_ami_id
  instance_type          = var.pr_instance_type
  subnet_id              = module.vpc.public_subnet_ids[0]
  key_name               = aws_key_pair.primerx_key.key_name
  vpc_security_group_ids = ["${aws_security_group.this.id}", "${aws_security_group.db.id}"]
  tags                   = local.tags
}

resource "aws_security_group" "this" {
  name   = format("%s-primerx-instance", var.env)
  vpc_id = module.vpc.id

  ingress {
    from_port   = var.pr_instance_port
    to_port     = var.pr_instance_port
    protocol    = "tcp"
    cidr_blocks = var.pr_allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name   = format("%s-primerx-instance-sg-db", var.env)
  vpc_id = module.vpc.id

  ingress {
    from_port       = var.pr_db_instance_port
    to_port         = var.pr_db_instance_port
    protocol        = "tcp"
    cidr_blocks     = var.pr_db_allowed_cidr_blocks
    security_groups = var.db_allowed_security_groups
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
