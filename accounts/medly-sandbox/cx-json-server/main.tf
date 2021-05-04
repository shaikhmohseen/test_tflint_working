provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "medly-sandbox-terraform-state"
    key            = "global/cxd-json-server/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-sandbox-state-locks"
    encrypt        = true
  }
}

resource "aws_instance" "cxd_json_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  tags                   = merge(var.tags, map("Name", format("cxd-json-server-%s", var.env)))
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name               = var.key_name
}

resource "aws_eip" "this" {
  instance = aws_instance.cxd_json_server.id
  vpc      = true
  tags     = merge(var.tags, map("Name", format("%s-%s-cxd-json-server", var.deployment_account, var.env)))
}

resource "aws_security_group" "this" {
  name = format("%s-security-group", var.env)

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
