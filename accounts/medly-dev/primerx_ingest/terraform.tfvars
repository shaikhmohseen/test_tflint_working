deployment_account        = "medly-dev"
aws_region                = "us-east-1"
env                       = "dev"
pr_availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
pr_vpc_cidr_block         = "10.3.0.0/16"
pr_private_subnets        = ["10.3.1.0/24", "10.3.2.0/24"]
pr_public_subnets         = ["10.3.3.0/24"]
pr_ami_id                 = "ami-02223251561cedf5d"
pr_instance_type          = "m4.xlarge"
pr_key_name               = "primerx-ingest-dev"
pr_allowed_cidr_blocks    = ["103.252.170.114/32", "157.33.240.222/32", "116.75.167.145/32", "103.207.8.99/32", "203.81.240.246/32"]
pr_db_allowed_cidr_blocks = ["54.174.72.208/32"]
mmspy_eb_app_name         = "ingest"
mmspy_solution_stack_name = "64bit Amazon Linux 2018.03 v2.22.0 running Multi-container Docker 19.03.6-ce (Generic)"
mmspy_environment_type    = "SingleInstance"
mmspy_aws_key_pair_name   = "primerx-ingest-dev"
mmspy_tier                = "Worker"
mmspy_instance_type       = "t3.medium"
mmspy_environment_variables = {
  CONNECTION_STRING = "Server=34.207.226.227;Database=PharmSQL;User Id=mms_reader;Password=BFeL3JjhJwuGqYpvDpsHZfei;"
  PHARMACY_NPI      = 2
}
ebp_version                  = "0.0.1"
ebp_name                     = "ingest"
ebp_ecr_image_tag_mutability = "MUTABLE"