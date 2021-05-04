aws_region                    = "us-east-1"
deployment_account            = "medly-uat"
env                           = "uat"
service_name                  = "satellite-service"
availability_zones            = ["us-east-1a", "us-east-1b"]
cidr_block                    = "10.58.0.0/16"
private_subnets               = ["10.58.0.0/24", "10.58.1.0/24"]
public_subnets                = ["10.58.2.0/24", "10.58.3.0/24"]
database_subnets              = ["10.58.4.0/24", "10.58.5.0/24"]
api_gateway_types             = ["REGIONAL"]
provisioned_concurrency_count = 2
enable_api_gw_logging         = true
api_gw_logging_level          = "INFO"
