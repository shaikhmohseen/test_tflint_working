aws_region            = "us-east-1"
deployment_account    = "medly-dev"
env                   = "dev"
service_name          = "watchtower-service"
availability_zones    = ["us-east-1a", "us-east-1b"]
cidr_block            = "10.15.0.0/16"
private_subnets       = ["10.15.0.0/24", "10.15.1.0/24"]
public_subnets        = ["10.15.2.0/24", "10.15.3.0/24"]
database_subnets      = ["10.15.4.0/24", "10.15.5.0/24"]
api_gateway_types     = ["REGIONAL"]
enable_api_gw_logging = false
api_gw_logging_level  = "INFO"