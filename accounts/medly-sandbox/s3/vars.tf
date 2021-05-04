variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "medly-sandbox"
}

variable "deployment_account" {
  type    = string
  default = "medly-sandbox"
}

variable "env" {
  type    = string
  default = "sandbox"
}

variable "ibd_domain_name" {
  default = ""
  type    = string
}

