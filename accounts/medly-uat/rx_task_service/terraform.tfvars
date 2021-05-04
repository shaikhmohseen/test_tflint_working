deployment_account            = "medly-uat"
aws_region                    = "us-east-1"
env                           = "uat"
domain_name                   = "uat-medly.io"
availability_zones            = ["us-east-1a", "us-east-1b"]
cidr_block                    = "10.62.0.0/16"
private_subnets               = ["10.62.0.0/24", "10.62.1.0/24"]
public_subnets                = ["10.62.2.0/24", "10.62.3.0/24"]
database_subnets              = ["10.62.4.0/24", "10.62.5.0/24"]
rds_username                  = "rx_task_service_user"
rds_password                  = "rx_task_service_password"
rds_dbname                    = "rx_task_service_db"
rds_max_capacity              = 8
rds_min_capacity              = 2
rds_auto_pause                = false
bastion_aws_key_pair_name     = "rx_task_service_bastion"
api_gateway_types             = ["REGIONAL"]
service_name                  = "rx-task-service"
queue_name                    = "mobile-scheduling-queue"
enable_rds_secrets_rotation   = true
enable_http_endpoint          = true
allow_rds_secret_access       = true
provisioned_concurrency_count = 8
enable_api_gw_logging         = true
api_gw_logging_level          = "INFO"