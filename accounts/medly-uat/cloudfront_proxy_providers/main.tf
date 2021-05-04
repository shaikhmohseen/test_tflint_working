data "terraform_remote_state" "ibd_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/ibd_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "satellite_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/satellite_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "facility_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/facility_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "patient_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/patient_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "delivery_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/delivery_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "prescription_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/prescription_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "onfleet_hospitals_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/onfleet_hospitals_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "delivery_hospitals_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/delivery_hospitals_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "mms_ingest_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/mms_ingest_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "rx_task_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/rx_task_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "rx_ingestion_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/rx_ingestion_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "payment_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/payment_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "scheduling_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/scheduling_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "insurance_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/insurance_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

data "terraform_remote_state" "onfleet_internal_service_s3" {
  backend = "s3"
  config = {
    bucket         = "medly-uat-terraform-state"
    key            = "global/onfleet_internal_service/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "medly-uat-state-locks"
    encrypt        = true
    profile        = "medly-uat"
  }
}

module "proxy" {
  source                     = "s3::https://s3.amazonaws.com/medly-dev-build-artifacts/terraform-modules/terraform-aws-cloudfront-proxy/v1.1.0.zip"
  cname                      = var.cname
  domain_name                = var.domain_name
  cloudfront_log_bucket      = var.cloudfront_log_bucket
  cloudfront_log_prefix      = var.cloudfront_log_prefix
  default_service_api_gw_url = data.terraform_remote_state.ibd_service_s3.outputs.api_gateway_base_url
  origins = [
    {
      "api_gw_url" : data.terraform_remote_state.prescription_service_s3.outputs.api_gateway_base_url
      "service_name" : "prescription",
      "custom_headers" : [
        {
          "name" : "X-Medly-App",
          "value" : "providers-app"
        },
      ],
    },
    {
      "api_gw_url" : data.terraform_remote_state.patient_service_s3.outputs.api_gateway_base_url,
      "service_name" : "patient",
      "custom_headers" : [
        {
          "name" : "X-Medly-App",
          "value" : "providers-app"
        },
      ],
    },
    {
      "api_gw_url" : data.terraform_remote_state.facility_service_s3.outputs.api_gateway_base_url
      "service_name" : "facility",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.satellite_service_s3.outputs.satellite_service_api_gateway_base_url
      "service_name" : "satellite"
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.ibd_service_s3.outputs.api_gateway_base_url
      "service_name" : "ibd"
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.onfleet_hospitals_service_s3.outputs.api_gateway_base_url
      "service_name" : "onfleet-hospitals",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.delivery_hospitals_service_s3.outputs.api_gateway_base_url
      "service_name" : "delivery-hospitals",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.mms_ingest_service_s3.outputs.api_gateway_base_url
      "service_name" : "mms-ingest",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.rx_task_service_s3.outputs.rx_task_service_api_gateway_base_url
      "service_name" : "rx-task",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.onfleet_internal_service_s3.outputs.api_gateway_base_url
      "service_name" : "onfleet-internal",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.rx_ingestion_service_s3.outputs.api_gateway_base_url
      "service_name" : "rx-ingestion",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.payment_service_s3.outputs.api_gateway_base_url
      "service_name" : "payment",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.scheduling_service_s3.outputs.scheduling_service_api_gateway_base_url
      "service_name" : "scheduling",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.insurance_service_s3.outputs.api_gateway_base_url
      "service_name" : "insurance",
      "custom_headers" : [],
    },
    {
      "api_gw_url" : data.terraform_remote_state.delivery_service_s3.outputs.api_gateway_base_url
      "service_name" : "delivery",
      "custom_headers" : [],
    }
  ]
  behaviours = [
    {
      "service_name" : "satellite",
      "path_pattern" : "api/satellite*"
    },
    {
      "service_name" : "ibd",
      "path_pattern" : "api/ibd*"
    },
    {
      "service_name" : "rx-task",
      "path_pattern" : "api/rx-task*"
    },
    {
      "service_name" : "rx-ingestion",
      "path_pattern" : "api/rx-ingest*"
    },
    {
      "service_name" : "prescription",
      "path_pattern" : "api/rx*"
    },
    {
      "service_name" : "patient",
      "path_pattern" : "api/ps*"
    },
    {
      "service_name" : "facility",
      "path_pattern" : "api/fs*"
    },
    {
      "service_name" : "ibd",
      "path_pattern" : "api/users*"
    },
    {
      "service_name" : "ibd",
      "path_pattern" : "api/alerts*"
    },
    {
      "service_name" : "facility",
      "path_pattern" : "api/providers*"
    },
    {
      "service_name" : "onfleet-hospitals",
      "path_pattern" : "api/onfleet/hospitals*"
    },
    {
      "service_name" : "delivery-hospitals",
      "path_pattern" : "api/hospital*"
    },
    {
      "service_name" : "mms-ingest",
      "path_pattern" : "api/mms-ingest*"
    },
    {
      "service_name" : "payment",
      "path_pattern" : "api/paym*"
    },
    {
      "service_name" : "scheduling",
      "path_pattern" : "api/sch*"
    },
    {
      "service_name" : "insurance",
      "path_pattern" : "api/ins*"
    },
    {
      "service_name" : "delivery",
      "path_pattern" : "api/dp*"
    },
    {
      "service_name" : "onfleet-internal",
      "path_pattern" : "api/onfleet/internal*"
    }
  ]
}
