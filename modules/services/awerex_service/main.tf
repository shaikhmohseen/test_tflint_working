locals {
  service_name    = "awerex-service"
  additional_tags = { resource-for = local.service_name, owner = local.service_name }
  //  vpc_name = "${local.service_name}-vpc"
}

//TODO: Remove this VPC if not required in future
//module "vpc" {
//  source               = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-vpc/v1.1.0.zip"
//  service_name         = local.service_name
//  env                  = var.env
//  aws_region           = var.aws_region
//  name                 = local.vpc_name
//  cidr_block           = "10.${var.subnet_octet}.0.0/16"
//  availability_zones   = var.availability_zones
//  private_subnets      = ["10.${var.subnet_octet}.0.0/24", "10.${var.subnet_octet}.1.0/24"]
//  public_subnets       = ["10.${var.subnet_octet}.2.0/24", "10.${var.subnet_octet}.3.0/24"]
//  database_subnets     = ["10.${var.subnet_octet}.4.0/24", "10.${var.subnet_octet}.5.0/24"]
//  enable_dns_support   = true
//  enable_dns_hostnames = true
//  enable_nat_gateway   = true
//  tags                 = merge(var.tags, {
//    service = local.service_name
//    env     = var.env
//    Name    = local.vpc_name
//  })
//}

resource "aws_eip" "eips" {
  count = var.eip_count
  vpc   = true
  tags = merge(var.tags, local.additional_tags, {
    service = local.service_name
    env     = var.env
    Name    = "${local.service_name}.eip.${count.index}"
  })

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip" "jumphost_eip" {
  vpc = true
  tags = merge(var.tags, local.additional_tags, {
    service = local.service_name
    env     = var.env
    Name    = "${local.service_name}.jumphost_eip"
  })

  lifecycle {
    prevent_destroy = true
  }
}
