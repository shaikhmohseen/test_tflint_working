deployment_account          = "medly-test"
aws_region                  = "us-east-1"
env                         = "test"
domain_name                 = "test-medly.io"
availability_zones          = ["us-east-1a", "us-east-1b"]
cidr_block                  = "10.112.0.0/16"
private_subnets             = ["10.112.0.0/24", "10.112.1.0/24"]
public_subnets              = ["10.112.2.0/24", "10.112.3.0/24"]
database_subnets            = ["10.112.4.0/24", "10.112.5.0/24"]
rds_username                = "rx_task_service_user"
rds_password                = "rx_task_service_password"
rds_dbname                  = "rx_task_service_db"
rds_max_capacity            = 2
rds_min_capacity            = 2
rds_auto_pause              = false
bastion_aws_key_pair_name   = "rx_task_service_bastion"
api_gateway_types           = ["REGIONAL"]
service_name                = "rx-task-service"
queue_name                  = "mobile-scheduling-queue"
enable_rds_secrets_rotation = true
enable_http_endpoint        = true
allow_rds_secret_access     = true
enable_api_gw_logging       = false
api_gw_logging_level        = "INFO"
